#!/usr/bin/env bash

set -e

# clear proxy settings if any
unset HTTP_PROXY
unset HTTPS_PROXY

# cleanup
# RUN apt-get purge -y \
#   build-essential git curl apt-transport-https \
#   postgresql-contrib postgresql-server-dev-12 libpq-dev libssl-dev zlib1g-dev \
#   bison flex && \
#   apt-get clean -y && \
#   apt-get autoclean -y && \
#   apt-get autoremove -y && \
#   rm -rf /var/lib/{apt,dpkg,cache,log}/ /tmp/* /var/tmp/*
