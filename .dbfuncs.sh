#!/bin/bash
# REQUIRES THAT YOU HAVE A .secrets file in your ~ dir!
. ~/.secrets

# updates the database
# @param {string} filename - .xml/.json liquibase file describing changes
# @param {string} dbname - database name
udb ()
{
    DBUN="ni_developers"
    DBPASS=$dbpass
    DBHOST="nirepdb"
    DBNAME=$2
    PORT="5432"
    FILENAME=$1
    echo
    echo "=== Update DB Request ==="
    echo "username: $DBUN"
    echo "host: $DBHOST"
    echo "dbname: $DBNAME"
    echo "port: 5432"
    echo "file: $FILENAME"
    echo "== = = = =="
    echo
    liquibase --classpath=/usr/lib/java/lib --username=${DBUN} --password=${DBPASS} --url=jdbc:postgresql://${DBHOST}:${PORT}/${DBNAME} --changeLogFile=${FILENAME} --defaultSchemaName=mrsdba --logLevel=info update
}



# rollsback the database
# @param {string} filename - .xml/.json liquibase file describing changes
# @param {string} dbname - database name
rdb ()
{
    DBUN="ni_developers"
    DBPASS=$dbpass
    DBHOST="nirepdb"
    DBNAME=$2
    PORT="5432"
    FILENAME=$1

    echo
    echo "=== Rollback DB Request ==="
    echo "username: $USERNAME"
    echo "host: $DBHOST"
    echo "dbname: $DBNAME"
    echo "port: 5432"
    echo "file: $FILENAME"
    echo "== = = = =="
    echo
    liquibase --classpath=/usr/lib/java/lib --username=${DBUN} --password=${DBPASS} --url=jdbc:postgresql://${DBHOST}:${PORT}/${DBNAME} --changeLogFile=$1 --logLevel=info --defaultSchemaName=mrsdba rollbackCount 99
}


# Performans rdb then udb with args passed.  Note: rdb & udb expect same parameters
rudb() {
    rdb "$@"
    udb "$@" # pass all args from this function into child func
}



# Performans udb then rdb with args passed.  Note: rdb & udb expect same parameters
urdb() {
    `udb "$@"`
    `rdb "$@"` # pass all args from this function into child func
}

