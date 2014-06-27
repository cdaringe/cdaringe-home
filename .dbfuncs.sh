#!/bin/bash
# REQUIRES THAT YOU HAVE A .secrets file in your ~ dir!
. ~/.secrets

# update database
udb () 
{
  USERNAME="ni_developers"
  PASSWORD=$dbpass
  DBHOST="nirepdb"
  DBNAME=$2
  PORT="5432"
  FILENAME=$1
  COMMAND = "liquibase --classpath=/usr/lib/java/lib --username=${USERNAME} --password=${PASSWORD} --url=jdbc:postgresql://${DBHOST}:${PORT}/${DBNAME} --changeLogFile=${FILENAME}  --defaultSchemaName=mrsdba --logLevel=info validate"

  echo "=== Update DB Request ==="
  echo "username: $USERNAME"
  #echo "password: $PASSWORD"
  echo "host: $DBHOST"
  echo "dbname: $DBNAME"
  echo "port: 5432"
  echo "file: $FILENAME"
  echo "===="
  liquibase --classpath=/usr/lib/java/lib --username=${USERNAME} --password=${PASSWORD} --url=jdbc:postgresql://${DBHOST}:${PORT}/${DBNAME} --changeLogFile=${FILENAME} --defaultSchemaName=mrsdba --logLevel=info update
}

rdb () 
{
  USERNAME="ni_developers"
  PASSWORD=$dbpass
  DBHOST="nirepdb"
  DBNAME=$2
  PORT="5432"
  FILENAME=$1

  echo "=== Rollback DB Request ==="
  echo "username: $USERNAME"
  #echo "password: $PASSWORD"
  echo "host: $DBHOST"
  echo "dbname: $DBNAME"
  echo "port: 5432"
  echo "file: $FILENAME"
  echo "===="
  liquibase --classpath=/usr/lib/java/lib --username=${USERNAME} --password=${PASSWORD} --url=jdbc:postgresql://${DBHOST}:${PORT}/${DBNAME} --changeLogFile=$1 --logLevel=info --defaultSchemaName=mrsdba rollbackCount 99
}
