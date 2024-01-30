# Ensembl OLS4 docker image for automated testing Ensembl OLS client and loader

### Related repositories 

- https://github.com/Ensembl/ols-client
- https://github.com/Ensembl/ols-ensembl-loader/

# Running the EMBL-EBI Ontology Lookup Service with docker

## Configuration

OLS4_CONFIG set the target ontologies definition to load when running the container.

## Build the container

`docker build -t ensembl-ols-docker .`

## Run the container
Assuming the path to your configuration file is "$(PWD)/ols-ensembl-config.json"

`docker run -it -p 8080:8080 -v /var/run/docker.sock:/var/run/docker.sock -v $(PWD)/ols-ensembl-config.json:/mnt/config.json ensemblorg/ensembl-ols-docker:latest`

Access the OLS through your browser on http://localhost:8080/api

## Updating the data

Rebuild the container to re-load new ontology versions.
