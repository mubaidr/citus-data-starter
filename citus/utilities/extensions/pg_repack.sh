#!/usr/bin/env bash

set -e

name="pg_repack"

echo "Downloading and installing: $name"

git clone --depth 1 https://github.com/reorg/$name

cd $name
make
make install

# cd ..
# rm -rf $name/*
