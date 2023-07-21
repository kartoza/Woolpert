#!/bin/sh
set -e
cp -r  /geoserver_data/data/printing/config/WAPP_logo.png /usr/local/tomcat/webapps/geoserver/data/printing/WAPP_logo.png
cp -r  /geoserver_data/data/printing/config/config.yaml /usr/local/tomcat/webapps/geoserver/data/printing/config.yaml
# Run the CMD 
exec "$@"