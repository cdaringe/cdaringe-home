#!/bin/bash
# REQUIRES THAT YOU HAVE A .secrets file in your ~ dir!
. ~/.secrets

# update database
updatedb () 
{
  USERNAME="ni_developers"
  PASSWORD=$dbpass
  DBHOST="nirepdb"
  DBNAME=$1
  PORT="5432"
  FILENAME=$2

  # if [ "$db" == "cddev" ]; then
  # fi

  echo "Validating ${FILENAME} on ${DBNAME}!"
  echo 'liquibase --classpath=/usr/lib/java/lib --username=${USERNAME} --password=${PASSWORD} --url=jdbc:postgresql://${DBHOST}:${PORT}/${DBNAME} --changeLogFile=$filenmae  --defaultSchemaName=mrsdba --logLevel=info validate'
  liquibase --classpath=/usr/lib/java/lib --username=${USERNAME} --password=${PASSWORD} --url=jdbc:postgresql://${DBHOST}:${PORT}/${DBNAME} --changeLogFile=$filenmae  --defaultSchemaName=mrsdba --logLevel=info validate
  echo "Updating ${DBHOST}:${DBNAME}"
  liquibase --classpath=/usr/lib/java/lib --username=${USERNAME} --password=${PASSWORD} --url=jdbc:postgresql://${DBHOST}:${PORT}/${DBNAME} --changeLogFile=$filenmae --defaultSchemaName=mrsdba --logLevel=info update
  echo ""
  echo "Done"
}

rollbackdb () 
{
  USERNAME="ni_developers"
  PASSWORD=$dbpass
  DBHOST="nirepdb"
  DBNAME=$db
  PORT="5432"
  FILENAME=$filename

  echo "Rolling back ${DBHOST}:${DBNAME}"
  liquibase --classpath=/usr/lib/java/lib --username=${USERNAME} --password=${PASSWORD} --url=jdbc:postgresql://${DBHOST}:${PORT}/${DBNAME} --changeLogFile=$1 --logLevel=debug --defaultSchemaName=mrsdba rollbackCount 99
  echo ""
  echo "Done"
}
