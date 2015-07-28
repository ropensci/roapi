# Dockerfile
FROM postgres:latest

RUN mkdir -p /tmp/psql_data/

COPY roapi.sql /tmp/psql_data/
COPY init_docker_postgres.sh /docker-entrypoint-initdb.d/
