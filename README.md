# Citus-Data-Starter

A template for quickly developing using Citus Data Community edition. Worry-free Postgres that scales out...

## Table of Contents

- [Features](#features)
- [Used Technology Stack](#used-technology-stack)
- [Prerequisites](#prerequisites)
- [Getting Started](#getting-started)

## Features

- [Docker](https://www.docker.com) based setup
- [Citus Data](https://www.citusdata.com)
- [PgAdmin](https://www.pgadmin.org)
- [PgHero](https://github.com/ankane/pghero) dashboard
- Schema setup on startup
  - Sample scripts in `citus/schema` directory
- Common extensions for Citus Data installed
  - `btree_gist`
  - `postgres-json-schema`
  - `periods`
  - `pg_stat_statements`
  - `pgcrypto`
  - `uuid-ossp`
  - `fuzzystrmatch`
  - `hll`
  - `pg_prewarm`
  - `hypopg`
  - `hstore`
  - `pg_trgm`
  - `pg_repack`
  - `moddatetime`
  - `topn`

## Prerequisites

- [Docker](https://www.docker.com) based setup
- and thats is

## Getting started

- Clone this repository `git clone https://github.com/mubaidr/citus-data-starter`
- Update `.env` configuraiton (`.env.example` available)
- Run using
  - `make run`
    or
  - `docker-compose --file docker-compose.dev.yml up`

## Issues and Contribution

Want to file a bug, contribute some code, or improve documentation? Excellent! Please make sure to check existing issues before opening a new one.

## Where to find me

Twitter: [@mubaidr](https://twitter.com/mubaidr)
