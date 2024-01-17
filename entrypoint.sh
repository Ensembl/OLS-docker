#!/bin/bash

# Defining cleanup procedure
cleanup() {
    echo "Container stopped. Running script..."
    docker compose down
}

# Trapping the SIGTERM
trap 'cleanup' SIGTERM

# Start docker service in background

echo "Starting compose ...."
echo "Building images..."
docker compose build --quiet
echo "Starting services..."
if [[ -z "${DEBUG}"  ]]; then
  docker compose up | grep ols4
else
  docker compose up
fi

