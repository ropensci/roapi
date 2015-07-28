#!/bin/bash

DATABASE_NAME="roapi"
DB_DUMP_LOCATION="/tmp/psql_data/roapi.sql"

echo "*** CREATING DATABASE ***"

gosu postgres postgres --single <<EOSQL
  CREATE DATABASE "$DATABASE_NAME";
  GRANT ALL PRIVILEGES ON DATABASE "$DATABASE_NAME" TO sckott;
EOSQL

# remove indentation
sed "s/^[ \t]*//" -i "$DB_DUMP_LOCATION"

# remove comments
sed '/^--/ d' -i "$DB_DUMP_LOCATION"

# remove new lines
sed ':a;N;$!ba;s/\n/ /g' -i "$DB_DUMP_LOCATION"

# remove other spaces
sed 's/  */ /g' -i "$DB_DUMP_LOCATION"

# remove firsts line spaces
sed 's/^ *//' -i "$DB_DUMP_LOCATION"

# import sql_dump
gosu postgres postgres --single "$DATABASE_NAME" < "$DB_DUMP_LOCATION";
