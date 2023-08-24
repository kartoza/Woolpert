"""
Name : Upload layer data into PostgreSQL table
Group : Kartoza
Import  Merge Upstream layers into a PostgreSQL database.
"""
from PyQt5.QtCore import QCoreApplication, QVariant, QDate
from qgis.core import QgsProcessing
from qgis.core import QgsProcessingAlgorithm
from qgis.core import QgsProcessingMultiStepFeedback
from qgis.core import QgsProcessingParameterVectorLayer
from qgis.core import QgsProcessingParameterProviderConnection
from qgis.core import QgsProcessingParameterDatabaseSchema
from qgis.core import QgsProviderRegistry
from qgis.core import QgsProcessingParameterBoolean
from qgis.core import QgsProcessingException
from qgis.core import NULL
import processing
from psycopg2 import connect, OperationalError
import sys


class DatabaseConnection(object):
    def __init__(self, db_connection):
        self.connection = None
        self.db_connection = db_connection
        self.connect()

    def connect(self):
        md = QgsProviderRegistry.instance().providerMetadata('postgres')
        conn = md.createConnection(self.db_connection)
        conn_uri = conn.uri()
        if 'service' in conn_uri:
            conn_uri = conn_uri.replace('estimatedmetadata=true', '')
        else:
            conn_uri = conn_uri.replace('estimatedmetadata=true', '')
        try:
            self.connection = connect(conn_uri)
        except OperationalError:
            raise QgsProcessingException(
                'PostgreSQL connection cannot be established, exiting. Please check your connection params')
            sys.exit(1)

    def get_connection(self):
        return self.connection

    def disconnect(self):
        if self.connection is not None:
            self.connection.close()
            self.connection = None


class Model(QgsProcessingAlgorithm):

    def initAlgorithm(self, config=None):
        self.addParameter(QgsProcessingParameterVectorLayer('master_vector_layer', 'Master Vector Layer',
                                                            types=[QgsProcessing.TypeVectorAnyGeometry],
                                                            defaultValue=None))
        self.addParameter(QgsProcessingParameterVectorLayer('input_vector_layer', 'Input Vector Layer',
                                                            types=[QgsProcessing.TypeVectorAnyGeometry],
                                                            defaultValue=None))
        self.addParameter(
            QgsProcessingParameterProviderConnection('Connection', 'Database Connection', 'postgres',
                                                     defaultValue=None))
        self.addParameter(
            QgsProcessingParameterDatabaseSchema('Project', 'Database Schema', connectionParameterName='Connection',
                                                 defaultValue='public'))
        self.addParameter(
            QgsProcessingParameterBoolean('VERBOSE_LOG', 'Verbose logging', optional=False, defaultValue=True))

    def processAlgorithm(self, parameters, context, model_feedback):
        # Use a multistep feedback, so that individual child algorithm progress reports are adjusted for the
        # overall progress through the model
        feedback = QgsProcessingMultiStepFeedback(1, model_feedback)
        results = {}
        outputs = {}
        try:
            db_connection = self.parameterAsConnectionName(parameters, 'Connection', context)
            db_conn = DatabaseConnection(db_connection)
            connection = db_conn.get_connection()

            master_layer_pg = self.parameterAsLayer(parameters, 'master_vector_layer', context)
            upload_layer_qgis = self.parameterAsLayer(parameters, 'input_vector_layer', context)
            # Execute PostgreSQL  SQL

            alg_params = {
                'DATABASE': parameters['Connection'],
                'SQL': '%s' % self.init_sql(master_layer_pg, upload_layer_qgis,
                                            connection, feedback,
                                            self.parameterAsSchema(parameters, 'Project', context))[0]
            }
            outputs['PostgresqlExecuteSql'] = processing.run('native:postgisexecutesql', alg_params, context=context,
                                                             feedback=feedback, is_child_algorithm=True)
        finally:
            db_conn.disconnect()
        return results

    def geometry_column_name(self, db_connection, db_table):
        # Connect to the PostgreSQL database
        conn = db_connection
        cursor = conn.cursor()
        # Define the SQL query to get foreign key relationships for the given table
        sql_query = f"""
        select f_geometry_column from geometry_columns where f_table_schema = 'public'
        and f_table_name = '{db_table}';
        """
        cursor.execute(sql_query)
        layer_geometry_column = cursor.fetchone()[0]
        return layer_geometry_column

    def layer_data_types(self, db_connection, db_table, db_schema):
        # Connect to the PostgreSQL database
        conn = db_connection
        cursor = conn.cursor()
        # Define the SQL query to get foreign key relationships for the given table
        sql_query = f"""
        SELECT column_name,data_type FROM
        information_schema.columns
        WHERE
        table_name = '{db_table}' and  column_name not in (
        select f_geometry_column from geometry_columns where f_table_schema = '{db_schema}'
        and f_table_name = '{db_table}');
        """
        cursor.execute(sql_query)
        layer_data_column = cursor.fetchall()
        layer_column_dict = {}
        for layer_value, layer_data_type in layer_data_column:
            layer_column_dict.update({layer_value: layer_data_type})
        return layer_column_dict

    def fk_sql(self, db_connection, db_table, db_feature):
        # Connect to the PostgreSQL database
        conn = db_connection
        cursor = conn.cursor()
        # Define the SQL query to get foreign key relationships for the given table
        sql_query = f"""
        SELECT
            tc.table_schema, 
            tc.table_name, 
            kcu.column_name, 
            ccu.table_schema AS foreign_table_schema,
            ccu.table_name AS foreign_table_name,
            ccu.column_name AS foreign_column_name 
        FROM 
            information_schema.table_constraints AS tc 
            JOIN information_schema.key_column_usage AS kcu
              ON tc.constraint_name = kcu.constraint_name
              AND tc.table_schema = kcu.table_schema
            JOIN information_schema.constraint_column_usage AS ccu
              ON ccu.constraint_name = tc.constraint_name
              AND ccu.table_schema = tc.table_schema
        WHERE 
            tc.constraint_type = 'FOREIGN KEY' 
            AND tc.table_name = '{db_table}';
        """

        # Execute the SQL query and fetch the results
        cursor.execute(sql_query)
        foreign_keys = cursor.fetchall()

        # Initialize the lists to store the WHERE conditions
        where_tables = set()
        where_table_values = {}
        # Define the fields for which 'OR' conditions should be applied
        fields_to_or = ['public.substation.name', 'public.country.iso']
        # Loop through the foreign keys and construct the WHERE conditions
        for foreign_key in foreign_keys:
            table_schema, table_name, column_name, foreign_table_schema, foreign_table_name, foreign_column_name = foreign_key
            if column_name in ["substation", "country"]:
                column_name = db_feature.attribute("%s" % column_name).replace("'", "''")
            else:
                column_value = db_feature.attribute("%s" % column_name)
                if column_value == NULL:
                    column_name = db_feature.attribute("%s" % column_name)
                else:
                    column_name = db_feature.attribute("%s" % column_name).replace("'", "''")

            table_identifier = f"{foreign_table_schema}.{foreign_table_name}"
            where_tables.add(table_identifier)

            condition = f"{foreign_table_schema}.{foreign_table_name}.{foreign_column_name} = '{column_name}'"

            # Check if the current field requires an 'OR' condition
            if any(field in condition for field in fields_to_or):
                if table_identifier not in where_table_values:
                    where_table_values[table_identifier] = [f"({condition})"]
                else:
                    where_table_values[table_identifier].append(f"({condition})")
            else:
                if table_identifier not in where_table_values:
                    where_table_values[table_identifier] = [condition]
                else:
                    where_table_values[table_identifier].append(condition)

        # Construct the SQL query for each table
        sql_parts = []
        for table in where_tables:
            if table in where_table_values:
                conditions = ' OR '.join(where_table_values[table])
                sql_parts.append(f"({conditions})")

        # Combine the WHERE conditions into the final SQL query
        sql_query = f"SELECT 1 FROM {', '.join(where_tables)} WHERE {' AND '.join(sql_parts)} "
        return sql_query

    def layer_fk_columns(self, db_connection, db_table):
        connection = db_connection
        cursor = connection.cursor()
        sql = """SELECT key_column_usage.column_name 
        FROM information_schema.table_constraints 
        JOIN information_schema.key_column_usage ON table_constraints.constraint_schema = key_column_usage.constraint_schema 
             AND table_constraints.constraint_name = key_column_usage.constraint_name 
        JOIN information_schema.referential_constraints ON table_constraints.constraint_schema = 
        referential_constraints.constraint_schema
             AND table_constraints.constraint_name = referential_constraints.constraint_name 
        JOIN information_schema.table_constraints AS table_constraints1 ON 
        referential_constraints.unique_constraint_schema
         = table_constraints1.constraint_schema 
             AND referential_constraints.unique_constraint_name = table_constraints1.constraint_name 
        WHERE table_constraints.constraint_type = 'FOREIGN KEY' and key_column_usage.table_name = '%s'
        ORDER BY key_column_usage.column_name""" % db_table
        cursor.execute(sql)
        fk_checker = cursor.fetchall()
        if fk_checker is None:
            fk_checker_dict = {}
        else:
            fk_checker_dict = {item[0] for item in fk_checker}
        return fk_checker_dict

    def layer_primary_key(self, master_layer):
        layer_pk = None
        master_layer_source = master_layer.source().split(" ")
        for detail in master_layer_source:
            if detail.startswith('key'):
                layer_pk = detail.replace("key=", '').lower()
                break
        return layer_pk

    def lowercase_field_names(self, upload_layer):
        for field in upload_layer.fields():
            name = field.name()
            if name.islower():
                continue
            upload_layer.startEditing()
            idx = upload_layer.fields().indexFromName(name)
            upload_layer.renameAttribute(idx, name.lower())
            upload_layer.commitChanges()

    def init_sql(self, master_layer, upload_layer, db_connection, feedback, db_schema):
        upload_layer_qgis_count = upload_layer.featureCount()
        total = 100.0 / upload_layer_qgis_count if upload_layer_qgis_count else 0
        self.lowercase_field_names(upload_layer)

        # Get the field names of the two layers
        master_layer_fields = [field.name() for field in master_layer.fields()]
        upload_layer_fields = {field.name(): field for field in upload_layer.fields()}

        # Get primary key of master layer
        layer_pk = self.layer_primary_key(master_layer)

        # Get the intersection of the field names
        common_fields = list(set(master_layer_fields).intersection(upload_layer_fields))
        # Remove PK in common fields if it exists

        if layer_pk.replace("'", '') in common_fields:
            common_fields.remove(layer_pk.replace("'", ''))

        # Generate the INSERT INTO SQL statement
        sql_rows = []  # List to store the individual rows for the SQL statement
        skipped_rows = []  # List to store the individual rows for the skipped_rows SQL statement

        # Define a dictionary that maps table names to their respective relation columns
        relation_columns = {
            'capacitor': self.layer_fk_columns(db_connection, 'capacitor'),
            'substation': self.layer_fk_columns(db_connection, 'substation'),
            'transformer': self.layer_fk_columns(db_connection, 'transformer'),
            'reactor': self.layer_fk_columns(db_connection, 'reactor'),
            'powerline': self.layer_fk_columns(db_connection, 'powerline'),
            'generator': self.layer_fk_columns(db_connection, 'generator'),
            'powerplant': self.layer_fk_columns(db_connection, 'powerplant')
        }

        if master_layer.name() in relation_columns:
            table_relation_columns = relation_columns[master_layer.name()]
            condition_columns = [column for column in table_relation_columns if column in common_fields]
            layer_data_types_dict_values = self.layer_data_types(db_connection, master_layer.name(), db_schema)

            # Check if all relation columns are contained in common_fields
            upload_layer_source = upload_layer.getFeatures()
            if len(condition_columns) == len(table_relation_columns):
                for current, feature in enumerate(upload_layer_source):
                    if feedback.isCanceled():
                        break
                    feedback.setProgress(int(current * total))
                    attribute_values = []
                    skip_row = False

                    for field in common_fields:
                        for dict_key, dict_value in layer_data_types_dict_values.items():
                            if field == dict_key:
                                value = feature[field.lower()]
                                if field in table_relation_columns:

                                    # Check for NULL values in the fields defined in relation_columns
                                    if value == NULL:
                                        skip_row = True
                                        break

                                if isinstance(value, str):
                                    if field in upload_layer_fields and upload_layer_fields[field].type() in [
                                        QVariant.Double, QVariant.Int]:
                                        skip_row = True
                                        break

                                    if value.find("'") != -1:
                                        formatted_value = value.replace("'", "''")
                                        value = f"'{formatted_value}'"
                                    else:
                                        value = f"'{value}'"
                                elif isinstance(value, QDate):
                                    date_value = value.toPyDate()
                                    value = f"'{date_value}'"

                                # Include dict_value in the SQL statement
                                value_string = f"{value}" + '::' + f"{dict_value}"

                                attribute_values.append(str(value_string))

                    if not skip_row and len(attribute_values) == len(common_fields):
                        # Get the geometry as WKT
                        geometry = feature.geometry().asWkt()

                        # Add the geometry value to attribute_values
                        attribute_values.append(f"ST_GeomFromText('{geometry}')")

                        value_string = ", ".join(attribute_values)

                        # Adjust the SQL statement based on the master_layer
                        condition_sql = self.fk_sql(db_connection, master_layer.name(), feature)
                        condition = f"EXISTS ({condition_sql})"
                        if condition:
                            # Append the condition to the SQL statement
                            sql_rows.append(f"SELECT {value_string} WHERE {condition}")
                        else:
                            # Append the value string to the list of rows
                            sql_rows.append(value_string)
                        print(" The final SQL is: ", sql_rows)
                    elif skip_row and len(attribute_values) == len(common_fields):
                        # Append the value string to the list of skipped rows
                        skipped_rows.append(value_string)

            else:
                missing_values = relation_columns[f"{master_layer.name()}"]
                raise QgsProcessingException(
                    'The table {} does not contain all columns needed for FK relations, '
                    'check if the columns {} are in your layer'.format(upload_layer.name(), missing_values))
        else:
            raise QgsProcessingException('Layer not found in relation_columns dictionary {}'.format(master_layer))

        # Generate the INSERT INTO SQL statement
        # feedback.setProgress(int(count * total))
        master_layer_geometry_column = self.geometry_column_name(db_connection, master_layer.name())
        sql_statement = f"INSERT INTO {master_layer.name()} ({', '.join(common_fields + [master_layer_geometry_column])}) "

        sql_statement += " UNION ALL ".join(sql_rows) + ";" if sql_rows else "INVALID SQL STATEMENT"

        # Generate the INSERT INTO SQL statement for skipped rows
        skipped_rows_sql = f"INSERT INTO {master_layer.name()} ({', '.join(common_fields + [master_layer_geometry_column])}) "
        skipped_rows_sql += ", ".join(skipped_rows) + ";" if skipped_rows else "NO SKIPPED ROWS"

        return sql_statement, skipped_rows_sql

    def tr(self, string):
        """
        Returns a translatable string with the self.tr() function.
        """
        return QCoreApplication.translate('Processing', string)

    def shortHelpString(self):
        """
        Returns a localised short helper string for the algorithm. This string
        should provide a basic description about what the algorithm does and the
        parameters and outputs associated with it..
        """
        return self.tr(
            "Update PostgreSQL vector layers \n\
            <mark style='color:blue'><strong>Algorithm Parameters</strong></mark>\n\
            <i>\n* <mark style='color:black'><strong>Master Vector Layer</strong></mark> - Loaded QGIS layer or "
            "OGR vector layer stored in PostgresQL.\
            \n* <mark style='color:black'><strong>Connection</strong></mark> - PostgreSQL connection name."
            " Must be a PostgreSQL service name or normal connection.\
            \n* <mark style='color:black'><strong>Input Vector Layer</strong></mark> - Vector layer which you need "
            "to copy features into a default layer.\
            <mark style='color:black'><strong>NOTE</strong></mark>\n\
            <mark style='color:black'>The algorithm will only select matching columns and use that to insert records. "
            "Foreign key columns should not be null, if they are they will be skipped in the upload.If the data type "
            "does not match the column name it is skipped and a SQL is provided to show the missed rows. \n\
            "
        )

    def name(self):
        return 'Update PostgreSQL vector layers'

    def displayName(self):
        return 'Update PostgreSQL vector layers'

    def group(self):
        return 'GIS'

    def groupId(self):
        return 'GIS'

    def createInstance(self):
        return Model()
