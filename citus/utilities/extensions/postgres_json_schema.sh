#!/usr/bin/env bash

set -e

name="postgres-json-schema"

echo "Downloading and installing: $name"

git clone --depth 1 https://github.com/gavinwahl/$name

cd $name
make
make install

# cd ..
# rm -rf $name/*
