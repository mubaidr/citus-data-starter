#!/usr/bin/env bash

set -e

# run background script to run scripts on db ready
/utilities/schema-update.sh &

# run postgres entrypoint for db configurations and starts postgres server
/docker-entrypoint.sh postgres
