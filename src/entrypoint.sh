#!/bin/bash

# Exit script in case of error
set -e

# Fix issue with geoip DB init
if [[ ! -f /mnt/volumes/statics/geoip.db ]];then
    GEOLITE_DOWNLOAD_URL="https://git.io/GeoLite2-City.mmdb"
    if [[ `wget -S --spider ${GEOLITE_DOWNLOAD_URL}  2>&1 | grep 'HTTP/1.1 200 OK'` ]]; then
         wget --progress=bar:force:noscroll -c --tries=2 ${GEOLITE_DOWNLOAD_URL} -O /mnt/volumes/statics/geoip.db
    else
        echo -e "URL : \e[1;31m ${GEOLITE_DOWNLOAD_URL} does not exists \033[0m"
    fi

fi
# Copy print configs to geoserver data dir
function copy_configs() {

  if [[ -f /geoserver-config/WAPP_logo.png ]];then
    cp -r  /geoserver-config/WAPP_logo.png $GEOSERVER_DATA_DIR/printing/
  fi

  if [[ -f /geoserver-config/config.yaml ]];then
    cp -r  /geoserver-config/config.yaml $GEOSERVER_DATA_DIR/printing/
  fi

  if [[ -f /geoserver-config/test.png ]];then
    cp -r  /geoserver-config/test.png $GEOSERVER_DATA_DIR/printing/
  fi


}

INVOKE_LOG_STDOUT=${INVOKE_LOG_STDOUT:-FALSE}
invoke () {
    if [ $INVOKE_LOG_STDOUT = 'true' ] || [ $INVOKE_LOG_STDOUT = 'True' ]
    then
        /usr/local/bin/invoke $@
    else
        /usr/local/bin/invoke $@ >> /usr/src/woolpert/invoke.log 2>&1
    fi
    echo "$@ tasks done"
}

# Start cron && memcached services
service cron restart
service memcached restart

echo $"\n\n\n"
echo "-----------------------------------------------------"
echo "STARTING DJANGO ENTRYPOINT $(date)"
echo "-----------------------------------------------------"

invoke update

source $HOME/.bashrc
source $HOME/.override_env

echo DOCKER_API_VERSION=$DOCKER_API_VERSION
echo POSTGRES_USER=$POSTGRES_USER
echo POSTGRES_PASSWORD=$POSTGRES_PASSWORD
echo DATABASE_URL=$DATABASE_URL
echo GEODATABASE_URL=$GEODATABASE_URL
echo SITEURL=$SITEURL
echo ALLOWED_HOSTS=$ALLOWED_HOSTS
echo GEOSERVER_PUBLIC_LOCATION=$GEOSERVER_PUBLIC_LOCATION
echo MONITORING_ENABLED=$MONITORING_ENABLED
echo MONITORING_HOST_NAME=$MONITORING_HOST_NAME
echo MONITORING_SERVICE_NAME=$MONITORING_SERVICE_NAME
echo MONITORING_DATA_TTL=$MONITORING_DATA_TTL

invoke waitfordbs

cmd="$@"

echo DOCKER_ENV=$DOCKER_ENV

if [ -z ${DOCKER_ENV} ] || [ ${DOCKER_ENV} = "development" ]
then

    invoke migrations
    invoke prepare
    invoke fixtures

    if [ ${IS_CELERY} = "true" ] || [ ${IS_CELERY} = "True" ]
    then

        echo "Executing Celery server $cmd for Development"

    else

        invoke devrequirements
        invoke statics

        echo "Executing standard Django server $cmd for Development"

    fi

else
    if [ ${IS_CELERY} = "true" ]  || [ ${IS_CELERY} = "True" ]
    then
        echo "Executing Celery server $cmd for Production"
    else

        invoke migrations
        invoke prepare

        if [ ${FORCE_REINIT} = "true" ]  || [ ${FORCE_REINIT} = "True" ] || [ ! -e "/mnt/volumes/statics/geonode_init.lock" ]; then
            echo "LOG INIT" > /usr/src/woolpert/invoke.log
            invoke updategeoip
            invoke fixtures
            invoke monitoringfixture
            invoke initialized
            invoke updateadmin
        fi

        invoke statics
        invoke waitforgeoserver
        copy_configs
        invoke geoserverfixture

        echo "Executing UWSGI server $cmd for Production"
    fi
fi

echo "-----------------------------------------------------"
echo "FINISHED DJANGO ENTRYPOINT --------------------------"
echo "-----------------------------------------------------"

# Run the CMD 
echo "got command $cmd"
exec $cmd
