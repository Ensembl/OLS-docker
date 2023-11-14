# Running the EMBL-EBI Ontology Lookup Service with docker

Here's an example of how to build and run your own docker container of the
[EBI's Ontology Lookup Service](https://www.ebi.ac.uk/ols4/) with custom
ontologies.

## Configuration

Edit [ols-config.json](ols-config.json) with the metadata for each ontology you
want to load into OLS. Example available ion https://github.com/EBISPOT/ols4/tree/dev/dataload/configs

## Build the container

`docker build -t ensembl-ols .`

## Run the container

`docker run -d -p 8080:8080 -v / -t ensembl-ols`

Access the OLS through your browser on http://localhost:8080

## Updating the data

Rebuild the container to re-load new ontology versions.
