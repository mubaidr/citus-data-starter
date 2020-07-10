#!/bin/bash

set -e

# variables adapted from https://github.com/docker-library/healthcheck
host="$(hostname -i || echo '127.0.0.1')"
port="${POSTGRES_PORT}"
db="${POSTGRES_DB}"
user="${POSTGRES_USER}"

pg_isready -h "${host}" -p "${port}" -d "${db}" -U "${user}" \
  --timeout=3 --quiet || exit 1
