import sys
from os import environ

import psycopg2
from geo.Geoserver import Geoserver
from requests import get, put, exceptions
from requests.auth import HTTPBasicAuth

GEO_USER = environ.get('GEOSERVER_ADMIN_USER', 'admin')
GEO_PASS = environ.get('GEOSERVER_ADMIN_PASSWORD', 'geoserver')
GEO_WORKSPACE = 'geonode'
GEOSERVER_INSTANCE_URL = environ.get('GEOSERVER_URL', 'http://localhost:8080/geoserver')
DATABASE_HOST = environ.get('POSTGRES_HOST', 'db')
DATABASE_USER = environ.get('GEONODE_GEODATABASE_USER')
DATABASE_PASSWORD = environ.get('GEONODE_GEODATABASE_PASSWORD')
DATABASE_NAME = environ.get('GEONODE_GEODATABASE')


def publish_workspace(geo_site_url, username, user_pass, workspace_name):
    geo = Geoserver(geo_site_url, username='%s' % username, password='%s' % user_pass)
    auth = HTTPBasicAuth('%s' % username, '%s' % user_pass)
    try:
        rest_url = '%s/rest/workspaces/%s.json' % (geo_site_url, workspace_name)
        response = get(rest_url, auth=auth)
        response.raise_for_status()
    except exceptions.HTTPError:
        geo.create_workspace(workspace='%s' % workspace_name)
        geo.set_default_workspace('%s' % workspace_name)


def publish_store(geo_site_url, username, user_pass, workspace_name, pg_host, pg_user, pg_pass, pg_name):
    geo = Geoserver(geo_site_url, username='%s' % username, password='%s' % user_pass)
    auth = HTTPBasicAuth('%s' % username, '%s' % user_pass)
    try:
        rest_url = '%s/rest/workspaces/%s/datastores/%s.json' % (geo_site_url, workspace_name, workspace_name)
        response = get(rest_url, auth=auth)
        response.raise_for_status()
    except exceptions.HTTPError:
        geo.create_featurestore(store_name='%s' % workspace_name, workspace='%s' % workspace_name, db='%s' % pg_name,
                                host='%s' % pg_host,
                                pg_user='%s' % pg_user, pg_password='%s' % pg_pass)


def pg_connection_details(pg_host, pg_user, pg_pass, pg_name):
    try:
        connection = psycopg2.connect(host='%s' % pg_host, database='%s' % pg_name,
                                      user='%s' % pg_user, password='%s' % pg_pass,
                                      port=5432)
        cursor = connection.cursor()
        check_table = ''' select table_name from information_schema.tables 
        WHERE  table_schema = 'public' and  table_name not like 'gf%' and table_name 
        not in ('spatial_ref_sys','geography_columns','geometry_columns','raster_columns',
        'raster_overviews','django_migrations','dynamic_models_fieldschema'); '''
        cursor.execute(check_table)
        _tables = cursor.fetchall()
        cursor.close()
        connection.close()
    except psycopg2.OperationalError:
        sys.exit(1)
    return _tables


def publish_layer_stores(geo_site_url, username, user_pass, workspace_name, pg_host, pg_user, pg_pass, pg_name):
    geo = Geoserver(geo_site_url, username='%s' % username, password='%s' % user_pass)
    auth = HTTPBasicAuth('%s' % username, '%s' % user_pass)
    pg_tables = pg_connection_details(pg_host, pg_user, pg_pass, pg_name)
    for table in pg_tables:
        try:
            rest_url = '%s/rest/workspaces/%s/datastores/%s/featuretypes/%s.json' % (
                geo_site_url, workspace_name, workspace_name, table)
            response = get(rest_url, auth=auth)
            response.raise_for_status()
        except exceptions.HTTPError:
            geo.publish_featurestore(workspace='%s'
                                               % workspace_name, store_name='%s' % workspace_name,
                                     pg_table='%s' % table)
           data_path = join(os.getcwd(),'styles','%s.sld' % table)
            geo.upload_style(path=r'%s' % data_path, workspace='%s' % GEO_WORKSPACE)
            geo.publish_style(layer_name='%s' % table, style_name='%s' % table, workspace='%s' % GEO_WORKSPACE)
            


def recalculate_bbox(geo_site_url, username, user_pass, workspace_name, pg_host, pg_user, pg_pass, pg_name):
    auth = HTTPBasicAuth('%s' % username, '%s' % user_pass)
    headers = {"Content-type": "text/xml"}
    xml_data = "<featureType><enabled>true</enabled></featureType>"
    _tables = pg_connection_details(pg_host, pg_user, pg_pass, pg_name)
    for table in _tables:
        rest_url = '%s/rest/workspaces/%s/datastores/%s/featuretypes/%s?recalculate=nativebbox,latlonbbox' % (
            geo_site_url, workspace_name, workspace_name, table)
        response = put(rest_url, headers=headers, data=xml_data, auth=auth)
        if response.status_code != 200:
            return response.raise_for_status


def main():
    publish_workspace(GEOSERVER_INSTANCE_URL, GEO_USER, GEO_PASS, GEO_WORKSPACE)
    publish_store(GEOSERVER_INSTANCE_URL, GEO_USER, GEO_PASS, GEO_WORKSPACE, DATABASE_HOST, DATABASE_USER,
                  DATABASE_PASSWORD, DATABASE_NAME)
    publish_layer_stores(GEOSERVER_INSTANCE_URL, GEO_USER, GEO_PASS, GEO_WORKSPACE, DATABASE_HOST, DATABASE_USER,
                         DATABASE_PASSWORD, DATABASE_NAME)
    recalculate_bbox(GEOSERVER_INSTANCE_URL, GEO_USER, GEO_PASS, GEO_WORKSPACE, DATABASE_HOST, DATABASE_USER,
                     DATABASE_PASSWORD, DATABASE_NAME)


if __name__ == '__main__':
    #    sys.exit(main(sys.argv))
    main()
