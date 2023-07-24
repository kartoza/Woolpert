
-- Assumes requests have been installed in the Image
CREATE OR REPLACE FUNCTION kartoza_publish_layer_to_geoserver(
    geo_site_url TEXT,
    store_name TEXT,
    geoserver_table_name TEXT
)
RETURNS TRIGGER AS $$
from requests.auth import HTTPBasicAuth
from requests import put
from os import environ


def recalculate_bbox(geo_site_url, store_name, geoserver_table_name):
    username = environ.get('GEOSERVER_ADMIN_USER','admin')
    user_pass = environ.get('GEOSERVER_ADMIN_PASSWORD', 'geoserver')
    workspace_name = environ.get('DEFAULT_WORKSPACE', 'geonode')
    auth = HTTPBasicAuth('%s' % username, '%s' % user_pass)
    headers = {"Content-type": "text/xml"}
    xml_data = "<featureType><enabled>true</enabled></featureType>"
    rest_url = '%s/rest/workspaces/%s/datastores/%s/featuretypes/%s?recalculate=nativebbox,latlonbbox' % (
        geo_site_url, workspace_name, store_name, geoserver_table_name)
    response = put(rest_url, headers=headers, data=xml_data, auth=auth)
    if response.status_code != 200:
        return response.raise_for_status


# Call the function
recalculate_bbox(geo_site_url,  store_name, geoserver_table_name)
$$ LANGUAGE plpython3u;

CREATE TRIGGER notify_capacitor_update
  BEFORE INSERT OR UPDATE OR DELETE  ON public.capacitor
    FOR EACH STATEMENT EXECUTE PROCEDURE kartoza_publish_layer_to_geoserver('https://woolpert-geonode.dev.do.kartoza.com/geoserver',   'ecowas', 'capacitor');

CREATE TRIGGER notify_generator_update
  BEFORE INSERT OR UPDATE OR DELETE  ON public.generator
    FOR EACH STATEMENT EXECUTE PROCEDURE kartoza_publish_layer_to_geoserver('https://woolpert-geonode.dev.do.kartoza.com/geoserver',   'ecowas', 'generator');

CREATE TRIGGER notify_power_plant_update
  BEFORE INSERT OR UPDATE OR DELETE  ON public.power_plant
    FOR EACH STATEMENT EXECUTE PROCEDURE kartoza_publish_layer_to_geoserver('https://woolpert-geonode.dev.do.kartoza.com/geoserver',   'ecowas', 'power_plant');

CREATE TRIGGER notify_powerline_update
  BEFORE INSERT OR UPDATE OR DELETE  ON public.powerline
    FOR EACH STATEMENT EXECUTE PROCEDURE kartoza_publish_layer_to_geoserver('https://woolpert-geonode.dev.do.kartoza.com/geoserver',   'ecowas', 'powerline');

CREATE TRIGGER notify_reactor_update
  BEFORE INSERT OR UPDATE OR DELETE  ON public.reactor
    FOR EACH STATEMENT EXECUTE PROCEDURE kartoza_publish_layer_to_geoserver('https://woolpert-geonode.dev.do.kartoza.com/geoserver',   'ecowas', 'reactor');

CREATE TRIGGER notify_substation_update
  BEFORE INSERT OR UPDATE OR DELETE  ON public.substation
    FOR EACH STATEMENT EXECUTE PROCEDURE kartoza_publish_layer_to_geoserver('https://woolpert-geonode.dev.do.kartoza.com/geoserver',   'ecowas', 'substation');

CREATE TRIGGER notify_transformer_update
  BEFORE INSERT OR UPDATE OR DELETE  ON public.transformer
    FOR EACH STATEMENT EXECUTE PROCEDURE kartoza_publish_layer_to_geoserver('https://woolpert-geonode.dev.do.kartoza.com/geoserver',   'ecowas', 'transformer');