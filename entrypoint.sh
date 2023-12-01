#!/bin/bash

# Turn on bash's job control
set -m

# Start docker service in background
/usr/local/bin/dockerd-entrypoint.sh &

while ! docker info; do
  echo "Waiting docker..."
  sleep 3
done

docker compose -f /opt/ols/docker-compose.yml up