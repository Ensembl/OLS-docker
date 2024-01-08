#!/bin/bash

# Turn on bash's job control
set -m

# Start docker service in background
echo "Starting Docker Daemon..."
/usr/local/bin/dockerd-entrypoint.sh & 2>/dev/null
while ! docker info; do
  echo "Waiting docker..."
  sleep 3
done
echo "Docker Started!"

#echo "Pulling ols4-solr...."
#docker compose pull --quiet ols4-solr
#echo "Pulling ols4-neo4j...."
#docker compose pull --quiet ols4-neo4j
#echo "Pulling ols4-backend...."
#docker compose pull --quiet ols4-backend
#echo "Pulling ols4-dataload...."
#docker compose pull --quiet ols4-dataload
#echo "Starting Services!...."
for file in /opt/ols/images/*.tar; do
  docker load < $file
done

docker compose up -d --quiet-pull --no-attach ols4-solr --no-attach ols4-neo4j --no-attach ols4-backend --no-attach ols4-dataload
echo "Services started :-)"