#!/bin/bash
# exit when any command fails 
set -e 
# trace the bash script command that is being executed
set -o xtrace

# expand alias
# docker login
shopt -s expand_aliases

# Install local requirements
# pip3 install pyyaml

# Network ziply_cxp_network declared as external, but could not be found.
# Please create the network manually using `docker network create ziply_cxp_network` and try again.
docker network create -d host airflow_network || true # do not fail this command if the network exists
docker network create -d host spark_network || true # do not fail this command if the network exists


export COMPOSE_PROJECT_NAME=dataeng


# bring up the airflow services
cd ./airflow
docker compose config > __generated_docker_config
# see https://stackoverflow.com/questions/69464001/docker-compose-container-name-use-dash-instead-of-underscore for why need --compatibility flag
docker compose build
cd ..

# bring up the spark services
cd ./spark
docker compose config > __generated_docker_config
docker compose build
cd ..