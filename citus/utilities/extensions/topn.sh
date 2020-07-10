#!/usr/bin/env bash

set -e

name="topn"

echo "Downloading and installing: $name"

git clone --depth 1 https://github.com/citusdata/postgresql-topn

cd $name
make
make install

# cd ..
# rm -rf $name/*
