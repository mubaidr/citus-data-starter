#!/usr/bin/env bash

set -e

# enable global proxy
if [ -z "${HTTP_PROXY}" ]; then
  unset HTTP_PROXY
  unset HTTPS_PROXY
fi
