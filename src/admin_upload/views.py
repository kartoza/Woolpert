from django.shortcuts import render, redirect
from django.http import HttpResponse, JsonResponse
from django.contrib.auth.decorators import user_passes_test
from geonode.layers.models import Dataset
import json
import psycopg2
import sys
from woolpert import settings
from decimal import *

data_types = {
    1560: bool,
    16: bool,
    17: bytes,
    1043: str,
    1182: "datetime",
    701: float,
    20: int,
    189314: float
}

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
        port     = json_data["database_port"]

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
        extra_len = 1
        if (any('location' in i for i in cursor.description)):
            if "location" in json_data['columns']:
                is_geom_uploaded = True
            else:
                # if uploaded file was not shape file
                extra_len = extra_len + 1
            is_geom = True
        
        column_len = len(json_data['columns']) + extra_len

        if len(cursor.description) != column_len:
            context = {
                "status": "error",
                "errors": "The number of columns in the file do not match the number of columns in the database"
            }
            return JsonResponse(context, status=200)
        
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
                       print(data)
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

def check_columns(request):
    if request.POST:
        json_data = json.loads(request.POST.get('json_data'))
        error_list = []

        dbHost     = json_data["database_host"]
        dbUsername = json_data["database_user"]
        dbPassword = json_data["database_psw"]
        dbName     = json_data["database_name"]
        port     = json_data["database_port"]

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

        cursor.execute(f"SELECT * FROM {json_data['layer']}")
        columns = cursor.description

        extra_len = 1
        if (any('location' in i for i in columns)):
            if "location" not in json_data['columns']:
                extra_len = extra_len + 1
        
        column_len = len(json_data['columns']) + extra_len

        if len(cursor.description) != column_len:
            context = {
                "status": "error",
                "errors": "The number of columns in the file do not match the number of columns in the database"
            }
            return JsonResponse(context, status=200)
        
        for col in columns:
            col_index = [i for i, x in enumerate(json_data["columns"]) if x == col[0]]
            if col_index:
                for row in json_data["rows"]:
                    data = row[col_index[0]]
                    data_type = data_types.get(col[1])
                    try:
                        data_type(data)
                    except:
                        error_list.append(f"Data '{data}' in column '{col[0]}' is not in the correct format")
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