"""
Name : Upload layer data into PostgreSQL table
Group : Kartoza
Import  Merge Upstream layers into a PostgreSQL database.
"""
from PyQt5.QtCore import QCoreApplication, QVariant
from qgis.core import QgsProcessing
from qgis.core import QgsProcessingAlgorithm
from qgis.core import QgsProcessingMultiStepFeedback
from qgis.core import QgsProcessingParameterVectorLayer
from qgis.core import QgsProcessingParameterProviderConnection
from qgis.core import QgsProcessingParameterDatabaseSchema
from qgis.core import QgsProviderRegistry, QgsDataSourceUri
from qgis.core import QgsProcessingParameterBoolean
import processing



def init_sql( master_layer, upload_layer):
    # Convert field names to lowercase
    for field in upload_layer.fields():
        name = field.name()
        upload_layer.startEditing()
        idx = upload_layer.fields().indexFromName(name)
        upload_layer.renameAttribute(idx, name.lower())
        upload_layer.commitChanges()
        # with edit(upload_layer):
        #     idx = upload_layer.fields().indexFromName(name)
        #     upload_layer.renameAttribute(idx, name.lower())

    # Get the field names of the two layers
    master_layer_fields = [field.name() for field in master_layer.fields()]
    upload_layer_fields = {field.name(): field for field in upload_layer.fields()}

    master_layer_source = master_layer.source().split(" ")
    for detail in master_layer_source:
        if detail.startswith('key'):
            layer_pk = detail.replace("key=",'')

    # Get the intersection of the field names
    common_fields = list(set(master_layer_fields).intersection(upload_layer_fields))
    if layer_pk in common_fields:
        common_fields.remove(layer_pk)

    # Generate the INSERT INTO SQL statement
    sql_statement = f"INSERT INTO {layer_foo.name()} ({', '.join(common_fields + ['geometry'])}) VALUES "
    skipped_rows_sql = f"INSERT INTO Skipped_Rows ({', '.join(common_fields + ['geometry'])}) VALUES "

    # Iterate over features in foo1 layer
    for feature in upload_layer.getFeatures():
        attribute_values = []
        skip_row = False
        for field in common_fields:
            value = feature[field.lower()]
            if isinstance(value, str):
                if field in upload_layer_fields and upload_layer_fields[field].type() in [QVariant.Double, QVariant.Int]:
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
            geometry = feature.geometry().asWkt()
            attribute_values.append(f"ST_GeomFromText('{geometry}')")
            value_string = "(" + ", ".join(attribute_values) + ")"
            sql_statement += value_string + ", "
        elif skip_row and len(attribute_values) == len(common_fields):
            value_string = "(" + ", ".join(attribute_values) + ")"
            skipped_rows_sql += value_string + ", "

    # Check if valid SQL statement
    if sql_statement.endswith(", "):
        # Remove the trailing comma and space, add semicolon
        sql_statement = sql_statement[:-2] + ";"
    else:
        sql_statement = "INVALID SQL STATEMENT"

    # Check if valid SQL statement for skipped rows
    if skipped_rows_sql.endswith(", "):
        # Remove the trailing comma and space, add semicolon
        skipped_rows_sql = skipped_rows_sql[:-2] + ";"
    else:
        skipped_rows_sql = "NO SKIPPED ROWS"

    # Print the SQL statements
    return sql_statement, skipped_rows_sql



class Model(QgsProcessingAlgorithm):

    def initAlgorithm(self, config=None):
        self.addParameter(QgsProcessingParameterVectorLayer('master_vector_layer', 'Master Vector Layer', types=[QgsProcessing.TypeVectorAnyGeometry], defaultValue=None))
        self.addParameter(QgsProcessingParameterVectorLayer('input_vector_layer', 'Input Vector Layer', types=[QgsProcessing.TypeVectorAnyGeometry], defaultValue=None))
        self.addParameter(
            QgsProcessingParameterProviderConnection('Connection', 'Database Connection', 'postgres',
                                                     defaultValue=None))
        self.addParameter(
            QgsProcessingParameterDatabaseSchema('Project', 'Database Schema', connectionParameterName='Connection',
                                                 defaultValue='public'))
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
        print(init_sql( master_layer_pg, upload_layer_qgis)[0])

        # PostgreSQL execute SQL
        alg_params = {
            'DATABASE': parameters['Connection'],
            'SQL': '%s' % init_sql( master_layer_pg, upload_layer_qgis)[0]
        }
        outputs['PostgresqlExecuteSql'] = processing.run('native:postgisexecutesql', alg_params, context=context, feedback=feedback, is_child_algorithm=True)
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
            <i>\n* <mark style='color:black'><strong>Master Vector Layer</strong></mark> - Loaded QGIS layer or OGR vector layer stored in PostgresQL.\
            \n* <mark style='color:black'><strong>Connection</strong></mark> - PostgreSQL connection name. Must be a PostgreSQL service name or normal connection.\
            \n* <mark style='color:black'><strong>Input Vector Layer</strong></mark> - Vector layer which you need to copy features into a default layer.\
            <mark style='color:black'><strong>NOTE</strong></mark>\n\
            <mark style='color:black'>The algorithm will only select matching columns and use that to insert records. If the data type does not match the column name it is skipped and a SQL is provided to show the missed rows. \n\
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
