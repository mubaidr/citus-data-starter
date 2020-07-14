#!/usr/bin/env bash

set -e

name="pg_cron"

echo "Downloading and installing: $name"

# install
curl https://install.citusdata.com/community/deb.sh | sudo bash
