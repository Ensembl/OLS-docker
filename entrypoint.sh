#!/bin/bash

# Trapping the SIGTERM
# trap 'cleanup' SIGTERM

# Turn on bash's job control
set -m
# Start docker service in background
echo "Starting Docker Daemon..."
/usr/local/bin/dockerd-entrypoint.sh "$@" &
sleep 5
while ! docker info; do
  echo "Waiting docker..."
  sleep 3
done
echo "Docker Started!!!!!"

docker compose up --quiet-pull --no-attach ols4-solr --no-attach ols4-neo4j --no-attach ols4-backend --no-attach ols4-dataload | grep ols4
