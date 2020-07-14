#!/usr/bin/env bash

set -e

# remove last line shared_preload_libraries='citus'
sed -i '$d' ${PGDATA}/postgresql.conf

# add extension configurations
cat <<EOT >>${PGDATA}/postgresql.conf
citus.enable_statistics_collection=off
shared_preload_libraries='citus,pg_cron,pg_stat_statements,cstore_fdw'
cron.database_name='${POSTGRES_DB}'
EOT

# restart postgres db
pg_ctl -D "${PGDATA}" reload -s
