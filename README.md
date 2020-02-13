# Running the EMBL-EBI Ontology Lookup Service with docker

Here's an example of how to build and run your own docker container of the
[EBI's Ontology Lookup Service](https://www.ebi.ac.uk/ols/) with custom
ontologies.

## Configuration

Edit [ols-config.yaml](ols-config.yaml) with the metadata for each ontology you
want to load into OLS. An example is provided for loading the data use ontology,
but any ontology in OBO or OWL format will work.

You can download the configuration in YAML format for one or multiple
ontologies from EBI OLS API. For example, to download the configuration for AERO
and EFO ontologies run:

`wget -O ols-config.yaml https://www.ebi.ac.uk/ols/api/ols-config\?ids\=aero,efo`


If you want to load an ontology from a local file on disk then add the ontology
to this directory and set `ontology_purl: file:///opt/ols/<filename>.owl`.
Alternately you can use a URL to load an ontology from the web e.g.
`ontology_purl: http://purl.obolibrary.org/obo/duo.owl`

## Build the container

`docker build -t ols .`

## Run the container

`docker run -d -p 8080:8080 -t ols`

Access the OLS through your browser on http://localhost:8080

## Updating the data

Rebuild the container to re-load new ontology versions.
