#!/usr/bin/env bash

set -e

name="wal-g"

echo "Downloading and installing: $name"

apt-get install -yq --no-install-recommends liblzo2-dev

# install
git clone --depth 1 github.com/$name/$name

cd $name
make install
make deps
make pg_build

# cd ..
# rm -rf $name/*
