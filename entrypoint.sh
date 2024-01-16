#!/bin/bash

# Defining cleanup procedure
cleanup() {
    echo "Container stopped. Running script..."
    docker compose down
}

# Trapping the SIGTERM
trap 'cleanup' SIGTERM

# Start docker service in background

echo "Starting services...."
if [[ -z "${DEBUG}"  ]]; then
  docker compose up -d --quiet-pull --no-attach ols4-backend | grep ols4
else
  docker compose up -d --quiet-pull --no-attach ols4-solr --no-attach ols4-neo4j
fi
wait $!
cleanup

