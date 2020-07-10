#!/usr/bin/env bash

set -e

# entry point unsets PGPASSWORD, but we need it to connect to workers
# https://github.com/docker-library/postgres/blob/33bccfcaddd0679f55ee1028c012d26cd196537d/12/docker-entrypoint.sh#L303
sed "/unset PGPASSWORD/d" -i /usr/local/bin/docker-entrypoint.sh
