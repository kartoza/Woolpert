from django.shortcuts import render, redirect
from django.http import HttpResponse, JsonResponse
from django.contrib.auth.decorators import user_passes_test
from geonode.layers.models import Dataset
import json
import psycopg2
import sys
from woolpert import settings

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
        x_index = [i for i, x in enumerate(json_data["columns"]) if x == 'x_dd']
        y_index = [i for i, x in enumerate(json_data["columns"]) if x == 'y_dd']

        dbHost     = settings.DATABASE_HOST
        dbName  = settings.GEONODE_GEODATABASE
        dbPassword = settings.GEONODE_GEODATABASE_PASSWORD
        dbUsername    = settings.GEONODE_GEODATABASE_USER

        error_list = []

        conn = psycopg2.connect(
            database=dbName, user=dbUsername, password=dbPassword, host=dbHost, port="5432"
        )
        cursor = conn.cursor()
        cursor.execute(f"SELECT max(fid) as max_id FROM {json_data['layer']}")
        max_id = cursor.fetchall()

        cursor.execute(f"SELECT * FROM {json_data['layer']}")
        data = cursor.fetchall()
        # cursor.execute("select oid,typname from pg_type;")
        # list_type = cursor.fetchall()
        # plus two for id and location
        column_len = len(json_data['columns']) + 2
        print(f"col {column_len} db {len(cursor.description)}")

        if len(cursor.description) != column_len:
            context = {
                "status": "error",
                "errors": "The number of columns in the file do not match the number of columns in the database"
            }
            return JsonResponse(context, status=200)
        
        columns_str = ""
        for col in cursor.description:
            columns_str = columns_str + f"{col[0]},"
        columns_str = columns_str[:-1]

        increment_id = 1
        for row in json_data["rows"]:
            id = int(max_id[0][0]) + increment_id

            values_str = f"{id},"
            for data in row:
               values_str = values_str + f"'{data}',"
            values_str = values_str + f"ST_SetSRID(ST_MakePoint({row[x_index[0]]}, {row[y_index[0]]}), 4326)"
            
            insert = conn.cursor()
            try:
                insert.execute(f"INSERT INTO {json_data['layer']} ({columns_str}) VALUES ({values_str})")
            except Exception as e:
                error_list.append(str({f"row {increment_id}": e}))
            conn.commit()
            increment_id = increment_id + 1
        print(error_list)
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