#!/bin/bash

# Defining cleanup procedure
cleanup() {
    echo "Container stopped. Running script..."
    docker compose down
}

# Trapping the SIGTERM
trap 'cleanup' SIGTERM

# Execute a command
docker compose up

# Wait
wait $!

# Cleanup
cleanup