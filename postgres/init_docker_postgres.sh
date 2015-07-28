#!/bin/bash

DB_DUMP_LOCATION="/tmp/psql_data/roapi.sql"

echo "*** CREATING DATABASE ***"

gosu postgres psql --dbname roapi <<EOSQL
	CREATE USER sckott SUPERUSER;
	DROP DATABASE roapi;
  CREATE DATABASE roapi;
  GRANT ALL PRIVILEGES ON DATABASE roapi TO sckott;
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