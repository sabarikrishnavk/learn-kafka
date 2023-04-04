#!/bin/bash

# Prereqs: docker-compose
#          curl

db2_store_details()
{
  cat <<EOF
  {
    "name": "db2_store_details",
    "config": {
      "connector.class": "io.confluent.connect.jdbc.JdbcSourceConnector",
      "connection.url": "jdbc:db2://host.docker.internal:50000/testdb",
      "connection.user": "db2inst1",
      "connection.password": "password",
      "topic.prefix": "db2.store.details",
      "mode":"bulk",
      "query":"SELECT STLOC.IDENTIFIER ,STLOC.PHONE , STLOC.ADDRESS1  , STLOC.city , STLOC.STATE  , \
            STLOC.COUNTRY  , STLOC.ZIPCODE  , CAST (STLOC.LATITUDE AS VARCHAR) AS  LATITUDE, \
            CAST (STLOC.LONGITUDE AS VARCHAR) AS  LONGITUDE  , LOCDS.NAME , LOCDS.DESCRIPTION \
            FROM DB2ADMIN.STLOC STLOC , DB2ADMIN.STLOCDS LOCDS \
            WHERE STLOC.STLOC_ID  = LOCDS.STLOC_ID ",
      "validate.non.null": false,
      "key.converter": "org.apache.kafka.connect.json.JsonConverter",
      "key.converter.schemas.enable": "false",
      "value.converter": "org.apache.kafka.connect.json.JsonConverter",
      "value.converter.schemas.enable": "false",
      "transforms": "createKey,extractKey",
      "transforms.createKey.type": "org.apache.kafka.connect.transforms.ValueToKey",
      "transforms.createKey.fields" : "IDENTIFIER",
      "transforms.extractKey.type" : "org.apache.kafka.connect.transforms.ExtractField\$Key",
      "transforms.extractKey.field" : "IDENTIFIER"
    }
  }
EOF
} 
curl -X DELETE http://localhost:8083/connectors/db2_store_details
# Configure kafka connect : db2_catentry
curl -i \
-H "Content-Type:application/json" \
-X POST --data "$(db2_store_details)" "http://localhost:8083/connectors"

 
db2_store_attribute()
{
  cat <<EOF
  {
    "name": "db2_store_attribute",
    "config": {
      "connector.class": "io.confluent.connect.jdbc.JdbcSourceConnector",
      "connection.url": "jdbc:db2://host.docker.internal:50000/testdb",
      "connection.user": "db2inst1",
      "connection.password": "password",
      "topic.prefix": "db2.store.attributes",
      "mode":"bulk",
      "query":"SELECT s2.IDENTIFIER  , s. NAME , s.VALUE  FROM Db2admin.STLOCATTR s  ,  Db2admin.STLOC s2 WHERE  s.STLOC_ID  =s2.STLOC_ID ", 
      "validate.non.null": false,
      "key.converter": "org.apache.kafka.connect.json.JsonConverter",
      "key.converter.schemas.enable": "false",
      "value.converter": "org.apache.kafka.connect.json.JsonConverter",
      "value.converter.schemas.enable": "false",
      "transforms": "createKey",
      "transforms.createKey.type": "org.apache.kafka.connect.transforms.ValueToKey",
      "transforms.createKey.fields" : "IDENTIFIER" 
    }
  }
EOF
}


curl -X DELETE http://localhost:8083/connectors/db2_store_attribute
# Configure kafka connect : db2_catentry
curl -i \
-H "Content-Type:application/json" \
-X POST --data "$(db2_store_attribute)" "http://localhost:8083/connectors"
 