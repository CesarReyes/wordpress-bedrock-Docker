#!/bin/bash

# Loads .env
set -o allexport
source .env
set +o allexport

composer create-project roots/bedrock $PROJECT_NAME

php genenv.php



# docker-compose up -d


