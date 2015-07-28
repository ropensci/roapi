# Dockerfile
FROM postgres:latest

RUN mkdir -p /tmp/psql_data/

COPY ~/roapi/roapi.sql /tmp/psql_data/
COPY ~/roapi/postgres/init_docker_postgres.sh /docker-entrypoint-initdb.d/
