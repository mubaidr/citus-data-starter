#!/bin/sh

set -e

# update default connection string from .env
sed -i "s/DB_HOST/$DB_HOST/g" /pgadmin4/servers.json &&
  sed -i "s/DB_NAME/$DB_NAME/g" /pgadmin4/servers.json &&
  sed -i "s/DB_PORT/$DB_PORT/g" /pgadmin4/servers.json &&
  sed -i "s/DB_USER/$DB_USER/g" /pgadmin4/servers.json

cat /pgadmin4/servers.json
