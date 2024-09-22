# json-merge-api

[![Docker](https://github.com/centja1/json-merge-api/actions/workflows/docker-publish.yml/badge.svg)](https://github.com/centja1/json-merge-api/actions/workflows/docker-publish.yml)


A simple bash script that starts a webserver on a given port (default 3000) and returns the merged representation of an arbitrary number of json files

Initially developed as an http endpoint to serve Traefik configuration files while allowing for separation of the configuration into multiple files.

## Usage

docker run -d --init --rm --name json-merge-api -p 3000:3000 -v **{FOLDER WITH JSON FILES}**:/config ghcr.io/centja1/json-merge-api:latest

When executed, the json files located in the mounted folder will be served as one document merged together.

### Optional Configuration
 * LISTEN_PORT environment variable: Controls the webserver port
 * MERGE_FOLDER environment variable: Controls where the shell script reads the json files to merge

docker run -d --init --rm --name json-merge-api -e LISTEN_PORT=9999 -e MERGE_FOLDER=/files -p 9999:9999 -v **{FOLDER WITH JSON FILES}**:/files ghcr.io/centja1/json-merge-api:latest

* This command will start a webserver on Port 9999 and serve files mounted at /files within the container