#!/bin/bash

POSTGRES_PASSWORD=$POSTGRES_PASSWORD

# Remove any versions of running containers first
docker rm -f -v rogeoip ropostgres roapi ronginx

# Make sure services are up-to-date
docker pull allingeek/docker-freegeoip
docker pull postgres:latest
docker pull nginx:latest

## Start some services: freegeoip
docker run --name fbgeoip -d allingeek/docker-freegeoip

######### FishBase DataBase ##################

docker run --name ropostgres \
  --restart=always -d \
  -e POSTGRES_PASSWORD=POSTGRES_PASSWORD \
  postgres:latest

docker build -t ropensci/roapi:latest .
#docker pull ropensci/fishbaseapi:latest
docker run --name roapi -d \
  --link ropostgres:postgres \
  --link rogeoip:geoip \
  --volumes-from ropensci/roapi:latest

# Must generate a .htpassword file first:
# assuming apache2-utils is installed: sudo htpasswd -cb .htpasswd $USER $PASSWORD
docker run --name fbnginx -d \
  -p 80:80 \
  --link roapi:api \
  -v ${PWD}/nginx.conf:/etc/nginx/nginx.conf \
  nginx:latest
