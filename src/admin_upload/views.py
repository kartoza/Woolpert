from django.shortcuts import render, redirect
from django.http import HttpResponse, JsonResponse
from django.contrib.auth.decorators import user_passes_test
from geonode.layers.models import Dataset
import json
import psycopg2
import sys
from woolpert import settings
from decimal import *
from osgeo import ogr
from django.core.files.storage import default_storage
import os
from zipfile import ZipFile
import shutil

def admin_required(function):
    def wrap(request, *args, **kwargs):
        user = request.user
        if user.is_superuser:
            return function(request, *args, *kwargs)
        else:
            return redirect("/")
    wrap.__doc__ = function.__doc__
    wrap.__name__ = function.__name__
    return wrap

# Create your views here.
@admin_required
def admin_form(request):
    if(request.POST):
        json_data = json.loads(request.POST.get('json_data'))

        dbHost     = json_data["database_host"]
        dbUsername = json_data["database_user"]
        dbPassword = json_data["database_psw"]
        dbName     = json_data["database_name"]
        port       = json_data["database_port"]

        try:
            conn = psycopg2.connect(
                    database=dbName, user=dbUsername, password=dbPassword, host=dbHost, port=port, sslmode='require'
                )
        except:
            context = {
            "status": "404",
            "errors": "Could not connect to Database"
            }
            return JsonResponse(context, status=200)

        x_index = [i for i, x in enumerate(json_data["columns"]) if x == 'x_dd']
        y_index = [i for i, x in enumerate(json_data["columns"]) if x == 'y_dd']

        error_list = []

        cursor = conn.cursor()
        # cursor.execute(f"SELECT max(fid) as max_id FROM {json_data['layer']}")
        # max_id = cursor.fetchall()

        cursor.execute(f"SELECT * FROM {json_data['layer']}")
        data = cursor.fetchall()

        is_geom = False
        is_geom_uploaded = False
        extra_len = 0

        get_primary = conn.cursor()
        get_primary.execute(f"""
            SELECT               
            pg_attribute.attname, 
            format_type(pg_attribute.atttypid, pg_attribute.atttypmod) 
            FROM pg_index, pg_class, pg_attribute, pg_namespace 
            WHERE 
            pg_class.oid = '{json_data['layer']}'::regclass AND 
            indrelid = pg_class.oid AND 
            nspname = 'public' AND 
            pg_class.relnamespace = pg_namespace.oid AND 
            pg_attribute.attrelid = pg_class.oid AND 
            pg_attribute.attnum = any(pg_index.indkey)
            AND indisprimary """)
        data_f = get_primary.fetchall()
        primary_key = data_f[0][0]

        if primary_key in json_data["columns"]:
            primary_index = [i for i, x in enumerate(json_data["columns"]) if x == primary_key]
            json_data["columns"].pop(primary_index[0])
            for row in json_data["rows"]:
                row.pop(primary_index[0])
                
        columns_str = ""
        for col in json_data['columns']:
            columns_str = columns_str + f"{col},"
        columns_str = columns_str[:-1]

        increment_id = 1
        for row in json_data["rows"]:
            values_str = ""
            # values_str = f"{id},"
            for data in row:
               try:
                   if "'" in data:
                       data = data.replace("'", "''")
               except:
                   pass
               values_str = values_str + f"'{data}',"
            values_str = values_str[:-1]
            
            insert = conn.cursor()
            try:
                insert.execute(f"INSERT INTO {json_data['layer']} ({columns_str}) VALUES ({values_str}) ON CONFLICT DO NOTHING")
                
                if is_geom and not is_geom_uploaded:
                    insert.execute('SELECT LASTVAL()')
                    lastid = insert.fetchone()[0]
                    update = conn.cursor()
                    update.execute(f"UPDATE {json_data['layer']} SET location = ST_SetSRID(ST_MakePoint({row[x_index[0]]}, {row[y_index[0]]}), 4326) WHERE fid = '{lastid}' ")
                    
            except Exception as e:
                conn.commit()
                error_list.append(str({f"row {increment_id}": e}))
            conn.commit()
            increment_id = increment_id + 1
        
        context = {
            "status": "finished",
            "errors": json.dumps(error_list)
        }
        return JsonResponse(context, status=200)
    layers = Dataset.objects.all()
    context = {
        "layers": layers
    }
    return render(request, "upload.html", context=context )

def read_shapefile(request):
    file_upload = request.FILES.get('file')

    file_name = default_storage.save(file_upload.name, file_upload)
    file_url = str(default_storage.open(file_name))

    with ZipFile(file_url, 'r') as f:
        extract_dir = file_url.replace(".zip", "/")
        f.extractall(extract_dir)

    zip_file_del = file_url
    folder_del = extract_dir

    shape_file_dir = ""
    for dir in os.scandir(extract_dir):
        if dir.is_dir():
            for _file in os.scandir(dir):
                file_ext = os.path.splitext(_file.path)
                if file_ext[1] == ".shp":
                    shape_file_dir = _file.path
        else:
            file_ext = os.path.splitext(dir.path)
            if file_ext[1] == ".shp":
                shape_file_dir = dir.path
    
    driver = ogr.GetDriverByName('ESRI Shapefile')
    try:
        dataSource = ogr.Open(shape_file_dir, 0)
        daLayer = dataSource.GetLayer(0)
    except:
        # os.remove(zip_file_del)
        # shutil.rmtree(folder_del)
        context = {
        "status": "error",
        }
        return JsonResponse(context, status=200)

    layerDefinition = daLayer.GetLayerDefn()
    layer = dataSource.GetLayer()

    column_headers = []
    row_data = []

    is_location = False
    for i in range(layerDefinition.GetFieldCount()):
        fieldName =  layerDefinition.GetFieldDefn(i).GetName()
        fieldTypeCode = layerDefinition.GetFieldDefn(i).GetType()
        fieldType = layerDefinition.GetFieldDefn(i).GetFieldTypeName(fieldTypeCode)
        fieldWidth = layerDefinition.GetFieldDefn(i).GetWidth()
        GetPrecision = layerDefinition.GetFieldDefn(i).GetPrecision()
        if fieldName == "location":
            is_location = True
        column_headers.append(fieldName)
    if not is_location:
        column_headers.append("location")

    for feature in layer:
        geom = feature.GetGeometryRef()
        location = geom.Centroid().ExportToWkt()
        feature_list = []
        for column in column_headers:
            try:
                if not is_location:
                    if column == "location":
                        feature_list.append(location)
                feature_list.append(feature.GetField(column))
            except:
                pass
        row_data.append(feature_list)

    # os.remove(zip_file_del)
    # shutil.rmtree(folder_del)
    context = {
        "status": "finished",
        "columns": json.dumps(column_headers),
        "rows": json.dumps(row_data)
    }
    return JsonResponse(context, status=200)
    
def check_columns(request):
    if request.POST:
        json_data = json.loads(request.POST.get('json_data'))
        error_list = []

        dbHost     = json_data["database_host"]
        dbUsername = json_data["database_user"]
        dbPassword = json_data["database_psw"]
        dbName     = json_data["database_name"]
        port       = json_data["database_port"]

        try:
            conn = psycopg2.connect(
                    database=dbName, user=dbUsername, password=dbPassword, host=dbHost, port=port, sslmode='require'
                )
        except:
            context = {
            "status": "404",
            "errors": "Could not connect to Database"
            }
            return JsonResponse(context, status=200)
            
        #get list of typenames for oid 
        cursor = conn.cursor()

        try:
            cursor.execute(f"SELECT * FROM {json_data['layer']}")
            columns = cursor.description
        except:
            context = {
                "status": "error",
                "errors": f"Could not find table {json_data['layer']}"
            }
            return JsonResponse(context, status=200)
        
        get_primary = conn.cursor()
        get_primary.execute(f"""
            SELECT               
            pg_attribute.attname, 
            format_type(pg_attribute.atttypid, pg_attribute.atttypmod) 
            FROM pg_index, pg_class, pg_attribute, pg_namespace 
            WHERE 
            pg_class.oid = '{json_data['layer']}'::regclass AND 
            indrelid = pg_class.oid AND 
            nspname = 'public' AND 
            pg_class.relnamespace = pg_namespace.oid AND 
            pg_attribute.attrelid = pg_class.oid AND 
            pg_attribute.attnum = any(pg_index.indkey)
            AND indisprimary """)
        data_f = get_primary.fetchall()
        primary_key = data_f[0][0]

        extra_len = 0
        is_geom = False
        is_geom_uploaded = False
        if (any('location' in i for i in cursor.description)):
            is_geom = True
            if "location" in json_data['columns']:
                is_geom_uploaded = True
            else:
                # if uploaded file was not shape file
                extra_len = extra_len + 1

        columns_not_in_db = []
        is_primary_uploaded = False
        if primary_key in json_data["columns"]:
            is_primary_uploaded = True

        for col in json_data["columns"]:
            if not (any(col in i for i in columns)):
                columns_not_in_db.append(col)
        
        columns_mssing_in_db = []
        for col in columns:
            if col[0] == primary_key and not is_primary_uploaded:
                pass
            elif is_geom and not is_geom_uploaded:
                pass
            elif not (any(col[0] in i for i in json_data['columns'])):
                columns_mssing_in_db.append(col[0])

        if columns_mssing_in_db or columns_not_in_db:
            context = {
                "status": "error",
                "errors": "The number of columns in the file do not match the number of columns in the database",
                "columns_mssing_in_db": json.dumps(columns_mssing_in_db),
                "columns_not_in_db": json.dumps(columns_not_in_db)
            }
            return JsonResponse(context, status=200)
        
        col_type = []

        for col in columns:
            check_data = conn.cursor()
            check_data.execute(f"SELECT pg_typeof({col[0]}) FROM {json_data['layer']} LIMIT 1")
            data = check_data.fetchall()
            col_type.append({"name": col[0], "type": data[0][0]})

        for row in json_data["rows"]:
            row_index = 0
            for data in row:
                col_index = col_type.index(next(filter(lambda n: n.get("name") == json_data['columns'][row_index], col_type)))
                check_type = col_type[col_index]["type"]
                
                try:
                    query = conn.cursor()
                    query.execute(f"SELECT CAST('{data}' AS {check_type});")
                    conn.commit()
                except psycopg2.Error as e:
                    conn.commit()
                    query.close()
                    error_list.append(f"Data '{data}' in column '{json_data['columns'][row_index]}' is not in the correct format. The data type should be {check_type}")
                finally:
                    row_index = row_index + 1
                
        context = {
            "status": "finished",
            "errors": json.dumps(error_list)
        }
        return JsonResponse(context, status=200)

        #get type of columns in database
    context = {
            "status": "empty request",
        }
    return JsonResponse(context, status=200)