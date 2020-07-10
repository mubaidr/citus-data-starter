#!/usr/bin/env bash

set -e

# we will run scripts on master node
if [ "$CITUS_NODE" = "worker" ]; then
  exit 0
fi

# check if server is up
until /utilities/pg_healthcheck.sh; do
  echo "waiting for db server..."
  sleep 1s
done

# check if queries can be run
until psql -d $POSTGRES_DB -U $POSTGRES_USER -c "select 1" >/dev/null 2>&1; do
  echo "waiting for db server to accept queries..."
  sleep 3s
done

# check if worker node is connected
while [ 0 -eq $(psql -d $POSTGRES_DB -U $POSTGRES_USER -c "SELECT count(*) from master_get_active_worker_nodes();" --tuples-only) ]; do
  echo "waiting for db server to add worker nodes..."
  sleep 3s
done

# wait for any db init scripts
sleep 5s

# runs all scripts
run_scripts() {
  for script in $(ls /schema/*.sql -1 | sort); do
    psql -d $POSTGRES_DB -U $POSTGRES_USER --file $script --output $script.log
  done

  echo "Schema scripts execution completed on node: $CITUS_NODE"
}

# execute db schema scripts
run_scripts
