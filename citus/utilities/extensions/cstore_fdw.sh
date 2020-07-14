#!/usr/bin/env bash

set -e

name="cstore_fdw"

echo "Downloading and installing: $name"

apt-get install -yq --no-install-recommends protobuf-c-compiler libprotobuf-c-dev

# install
git clone --depth 1 github.com/citusdata/$name

cd $name
make
make install

# cd ..
# rm -rf $name/*
