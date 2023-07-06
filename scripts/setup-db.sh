#!/usr/bin/env bash


function create_user() {
  DB_USER=$1
  DB_PASS=$2
  echo "Creating superuser ${DB_USER}"
  RESULT=`su - postgres -c "psql postgres -t -c \"SELECT 1 FROM pg_roles WHERE rolname = '${DB_USER}'\""`
  COMMAND="ALTER"
  if [ -z "$RESULT" ]; then
    COMMAND="CREATE"
  fi
  su - postgres -c "psql postgres -c \"$COMMAND USER ${DB_USER} WITH SUPERUSER ENCRYPTED PASSWORD '${DB_PASS}';\""

}

create_user ${GEONODE_DATABASE_USER}  ${GEONODE_DATABASE_PASSWORD}
create_user ${GEONODE_GEODATABASE_USER}  ${GEONODE_GEODATABASE_PASSWORD}
