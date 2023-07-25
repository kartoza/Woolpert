"""
Name : Upload layer data into Geopackage table
Group : Kartoza
Import  Merge Upstream layers into a Geopackage database.
"""
from PyQt5.QtCore import QCoreApplication, QVariant, QDate
from qgis.core import QgsProcessing
from qgis.core import QgsProcessingAlgorithm
from qgis.core import QgsProcessingMultiStepFeedback
from qgis.core import QgsProcessingParameterVectorLayer
from qgis.core import QgsProcessingParameterProviderConnection
from qgis.core import QgsProcessingParameterDatabaseSchema
from qgis.core import QgsProviderRegistry, QgsDataSourceUri
from qgis.core import QgsProcessingParameterBoolean
from qgis.core import QgsProcessingException
import processing


def start_connection(db_connection):
    connection_name = db_connection
    md = QgsProviderRegistry.instance().providerMetadata('ogr')
    conn = md.createConnection(connection_name)
    return conn


def layer_primary_key(master_layer):
    layer_pk = None
    master_layer_source = master_layer.source().split(" ")
    for detail in master_layer_source:
        if detail.startswith('key'):
            layer_pk = detail.replace("key=", '')
            break
    return layer_pk


def lowercase_field_names(upload_layer):
    # Convert field names to lowercase
    for field in upload_layer.fields():
        name = field.name()
        if name.islower():
            continue
        upload_layer.startEditing()
        idx = upload_layer.fields().indexFromName(name)
        upload_layer.renameAttribute(idx, name.lower())
        upload_layer.commitChanges()
        # with edit(upload_layer):
        #     idx = upload_layer.fields().indexFromName(name)
        #     upload_layer.renameAttribute(idx, name.lower())


def get_data_source_type(layer):
    # geo_check = None
    source_type = layer.source()
    extension = '.gpkg'

    if extension in source_type:
        geo_check = True
        # break
    return geo_check


def geopackage_path(layer):
    path = layer.source().split("|")[0]
    return path


def init_sql(master_layer, upload_layer):
    lowercase_field_names(upload_layer)

    # Get the field names of the two layers
    master_layer_fields = [field.name() for field in master_layer.fields()]
    upload_layer_fields = {field.name(): field for field in upload_layer.fields()}

    # Get primary key of master layer
    layer_pk = layer_primary_key(master_layer)

    # Get the intersection of the field names
    common_fields = list(set(master_layer_fields).intersection(upload_layer_fields))
    # Remove PK in common fields if it exists
    if layer_pk in common_fields:
        common_fields.remove(layer_pk)

    # Generate the INSERT INTO SQL statement
    sql_rows = []  # List to store the individual rows for the SQL statement
    skipped_rows = []  # List to store the individual rows for the skipped_rows SQL statement

    # Define a dictionary that maps table names to their respective relation columns
    relation_columns = {
        'capacitor': {'country', 'substation', 'status', 'capacitor_type', 'condition'},
        'substation': {'country', 'substation_type', 'situation', 'utility'},
        'transformer': {'country', 'substation', 'utility', 'cooling', 'tap_ch', 'connection'},
        'reactor': {'country', 'substation', 'shunt_reac'},
        'powerline': {'country', 'country2', 'cable_type', 'ext1', 'ext2', 'powerline_type', 'situation', 'utility'},
        'generator': {'country', 'substation', 'utility', 'general_type'},
        'powerplant': {'country', 'general_type', 'situation', 'connection'}
    }

    if master_layer.name() in relation_columns:
        table_relation_columns = relation_columns[master_layer.name()]
        condition_columns = [column for column in table_relation_columns if column in common_fields]

        # Check if all relation columns are contained in common_fields
        if len(condition_columns) == len(table_relation_columns):
            for feature in upload_layer.getFeatures():
                attribute_values = []
                skip_row = False

                for field in common_fields:
                    value = feature[field.lower()]
                    if field in table_relation_columns:

                        # Check for NULL values in the fields defined in relation_columns
                        if value == NULL:
                            skip_row = True
                            break

                    if isinstance(value, str):
                        if field in upload_layer_fields and upload_layer_fields[field].type() in [QVariant.Double,
                                                                                                  QVariant.Int]:
                            skip_row = True
                            break

                        if value.find("'") != -1:
                            formated_value = value.replace("'", "''")
                            value = f"'{formated_value}'"
                        else:
                            value = f"'{value}'"
                    elif isinstance(value, QDate):
                        date_value = value.toPyDate()
                        value = f"'{date_value}'"

                    attribute_values.append(str(value))

                if not skip_row and len(attribute_values) == len(common_fields):
                    # Get the geometry as WKT
                    geometry = feature.geometry().asWkt()

                    # Add the geometry value to attribute_values
                    attribute_values.append(f"ST_GeomFromText('{geometry}')")

                    value_string = ", ".join(attribute_values)

                    # Adjust the SQL statement based on the master_layer
                    condition = ""
                    if master_layer.name() == 'capacitor':
                        # Capacitor table
                        condition = f"""
                            EXISTS (
                                SELECT 1
                                FROM public.country, public.substation, public.status, public.capacitor_type, public.condition
                                WHERE
                                    public.country.name = '{feature['country']}'
                                    AND public.substation.name = '{feature['substation']}'
                                    AND public.status.name = '{feature['status']}'
                                    AND public.capacitor_type.name = '{feature['capacitor_type']}'
                                    AND public.condition.name = '{feature['condition']}'
                            )
                        """
                    elif master_layer.name() == 'substation':
                        # Substation table
                        condition = f"""
                            EXISTS (
                                SELECT 1
                                FROM public.country, public.substation_type, public.situation, public.utility
                                WHERE
                                    public.country.name = '{feature['country']}'
                                    AND public.substation_type.name = '{feature['substation_type']}'
                                    AND public.situation.name = '{feature['situation']}'
                                    AND public.utility.name = '{feature['utility']}'
                            )
                        """
                    elif master_layer.name() == 'transformer':
                        # Transformer table
                        condition = f"""
                            EXISTS (
                                SELECT 1
                                FROM public.country, public.substation, public.utility, public.cooling, public.tap_ch, public.transformer_connection
                                WHERE
                                    public.country.name = '{feature['country']}'
                                    AND public.substation.name = '{feature['substation']}'
                                    AND public.utility.name = '{feature['utility']}'
                                    AND public.cooling.name = '{feature['cooling']}'
                                    AND public.tap_ch.name = '{feature['tap_ch']}'
                                    AND public.transformer_connection.name = '{feature['connection']}'
                            )
                        """
                    elif master_layer.name() == 'reactor':
                        # Reactor table
                        condition = f"""
                            EXISTS (
                                SELECT 1
                                FROM public.country, public.substation, public.shunt_reac
                                WHERE
                                    public.country.name = '{feature['country']}'
                                    AND public.substation.name = '{feature['substation']}'
                                    AND public.shunt_reac.name = '{feature['shunt_reac']}'
                            )
                        """
                    elif master_layer.name() == 'powerline':
                        # Powerline table
                        condition = f"""
                            EXISTS (
                                SELECT 1
                                FROM public.country, public.substation, public.situation, public.powerline_type, public.cable_type
                                WHERE
                                    public.country.name = '{feature['country']}'
                                    AND public.substation.name = '{feature['country']}'
                                    AND public.situation.name = '{feature['country']}'
                                    AND public.powerline_type.name = '{feature['country']}'
                                    AND public.cable_type.name = '{feature['country']}'
                            )
                        """
                    elif master_layer.name() == 'generator':
                        # Generator table
                        condition = f"""
                            EXISTS (
                                SELECT 1
                                FROM public.country, public.substation, public.utility, public.general_type
                                WHERE
                                    public.country.name = '{feature['country']}'
                                    AND public.substation.name = '{feature['substation']}'
                                    AND public.utility.name = '{feature['utility']}'
                                    AND public.general_type.name = '{feature['general_type']}'
                            )
                        """
                    elif master_layer.name() == 'powerplant':
                        # Powerplant table
                        condition = f"""
                            EXISTS (
                                SELECT 1
                                FROM public.country public.general_type, public.situation, public.connection
                                WHERE
                                    public.country.name = '{feature['country']}'
                                    AND public.general_type.name = '{feature['general_type']}'
                                    AND public.situation.name = '{feature['situation']}'
                                    AND public.connection.name = '{feature['connection']}'
                            )
                        """
                    else:
                        condition = ""

                    if condition:
                        # Append the condition to the SQL statement
                        sql_rows.append(f"SELECT {value_string} WHERE {condition}")
                    else:
                        # Append the value string to the list of rows
                        sql_rows.append(value_string)
                elif skip_row and len(attribute_values) == len(common_fields):
                    # Append the value string to the list of skipped rows
                    skipped_rows.append(value_string)
        else:
            missing_values = relation_columns[f"{master_layer.name()}"]
            raise QgsProcessingException('The table {} does not contain all columns needed for FK relations,\
            check if the columns {} are in your layer'.format(upload_layer.name(), missing_values))
    else:
        raise QgsProcessingException('Layer not found in relation_columns dictionary {}'.format(master_layer))

    # Generate the INSERT INTO SQL statement
    sql_statement = f"INSERT INTO {master_layer.name()} ({', '.join(common_fields + ['geometry'])})  "
    sql_statement += ", ".join(sql_rows) + ";" if sql_rows else "INVALID SQL STATEMENT"

    # Generate the INSERT INTO SQL statement for skipped rows
    skipped_rows_sql = f"INSERT INTO Skipped_Rows ({', '.join(common_fields + ['geometry'])})  "
    skipped_rows_sql += ", ".join(skipped_rows) + ";" if skipped_rows else "NO SKIPPED ROWS"

    return sql_statement, skipped_rows_sql


class Model(QgsProcessingAlgorithm):

    def initAlgorithm(self, config=None):
        self.addParameter(QgsProcessingParameterVectorLayer('master_vector_layer', 'Master Vector Layer',
                                                            types=[QgsProcessing.TypeVectorAnyGeometry],
                                                            defaultValue=None))
        self.addParameter(QgsProcessingParameterVectorLayer('input_vector_layer', 'Input Vector Layer',
                                                            types=[QgsProcessing.TypeVectorAnyGeometry],
                                                            defaultValue=None))
        self.addParameter(QgsProcessingParameterProviderConnection('GeopackageConnection',
                                                                   'Geopackage Database connection', 'ogr',
                                                                   defaultValue=None))
        self.addParameter(
            QgsProcessingParameterBoolean('VERBOSE_LOG', 'Verbose logging', optional=False, defaultValue=True))

    def processAlgorithm(self, parameters, context, model_feedback):
        # Use a multi-step feedback, so that individual child algorithm progress reports are adjusted for the
        # overall progress through the model
        feedback = QgsProcessingMultiStepFeedback(1, model_feedback)
        results = {}
        outputs = {}

        master_layer_pg = self.parameterAsLayer(parameters, 'master_vector_layer', context)
        upload_layer_qgis = self.parameterAsLayer(parameters, 'input_vector_layer', context)
        # Execute Geopackage  SQL

        if get_data_source_type(master_layer_pg) is True:
            # Execute SQL, replace this logic when https://github.com/qgis/QGIS/issues/53905 is fixed
            # md = QgsProviderRegistry.instance().providerMetadata("ogr")
            # connection = md.createConnection(geopackage_path(master_layer_pg), {})
            connection = start_connection(self.parameterAsConnectionName(parameters, 'GeopackageConnection', context))
            # connection.executeSql('select EnableGpkgAmphibiousMode()')
            connection.executeSql('%s' % init_sql(master_layer_pg, upload_layer_qgis)[0])
            md.disconnect()
        else:
            alg_params = {
                'DATABASE': parameters['Connection'],
                'SQL': '%s' % init_sql(master_layer_pg, upload_layer_qgis)[0]
            }
            outputs['PostgresqlExecuteSql'] = processing.run('native:postgisexecutesql', alg_params, context=context,
                                                             feedback=feedback, is_child_algorithm=True)
        return results

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
            <i>\n* <mark style='color:black'><strong>Master Vector Layer</strong></mark> - Loaded QGIS layer or OGR vector layer stored in GeoPackage.\
            \n* <mark style='color:black'><strong>Connection</strong></mark> - Geopackage connection name. Must be a registered in Data Source manager.\
            \n* <mark style='color:black'><strong>Input Vector Layer</strong></mark> - Vector layer which you need to copy features into a default layer.\
            <mark style='color:black'><strong>NOTE</strong></mark>\n\
            <mark style='color:black'>The algorithm will only select matching columns and use that to insert records. Foreign key columns should not be null, if they are they will be skipped in the upload.If the data type does not match the column name it is skipped and a SQL is provided to show the missed rows. \n\
            "
        )

    def name(self):
        return 'Update Geopackage vector layers'

    def displayName(self):
        return 'Update Geopackage vector layers'

    def group(self):
        return 'GIS'

    def groupId(self):
        return 'GIS'

    def createInstance(self):
        return Model()
