#!/bin/bash
# exit when any command fails 
set -e 
# trace the bash script command that is being executed
set -o xtrace

export COMPOSE_PROJECT_NAME=dataeng

# just brings down the services, but keeps the data mounted.
cd ./airflow/
docker compose down --remove-orphans
cd ..
cd ./spark/
docker compose down --remove-orphans
cd ..
