#!/bin/bash

# Prereqs: docker-compose
#          curl

# db2_attr_all()
# {
#   cat <<EOF
#   {
#     "name": "db2_attr_all",
#     "config": {
#       "connector.class": "io.confluent.connect.jdbc.JdbcSourceConnector",
#       "connection.url": "jdbc:db2://host.docker.internal:50000/testdb",
#       "connection.user": "db2inst1",
#       "connection.password": "password",
#       "topic.prefix": "db2_attr_all",
#       "mode": "bulk", 
#       "query": "SELECT a.ATTR_ID  ,  a.IDENTIFIER AS ATTRIDENTIFIER , a.ATTRTYPE_ID ,  a.ATTRDICT_ID , \
#           a.STOREENT_ID , a.SEQUENCE AS ATTRSEQUENCE,  a.DISPLAYABLE ,  a.SEARCHABLE , \
#           a.COMPARABLE , a.ATTRUSAGE , a.STOREDISPLAY ,  a.FACETABLE , a.MERCHANDISABLE , \
#           a.SWATCHABLE , b.ATTRVAL_ID ,   c.VALUSAGE ,   c.LANGUAGE_ID ,  c.VALUSAGE , c.SEQUENCE AS VALSEQUENCE,  \
#           c.INTEGERVALUE , c.FLOATVALUE , c.QTYUNIT_ID  , \
#           c.VALUE AS VALVALUE , c.STRINGVALUE, b.IDENTIFIER AS VALIDENTIFIER \
#           FROM DB2ADMIN.ATTR a \
#           LEFT JOIN DB2ADMIN.ATTRVAL b on a.ATTR_ID = b.ATTR_ID  \
#           LEFT JOIN DB2ADMIN.ATTRVALDESC c on a.ATTR_ID = c.ATTR_ID AND b.ATTRVAL_ID = c.ATTRVAL_ID ",
#       "schema.pattern" : "DB2ADMIN",  
#       "key.converter": "org.apache.kafka.connect.json.JsonConverter",
#       "key.converter.schemas.enable": "false",
#       "value.converter": "io.confluent.connect.avro.AvroConverter",
#       "value.converter.schema.registry.url": "http://schema-registry:8081", 
#       "transforms": "createKey",
#       "transforms.createKey.type": "org.apache.kafka.connect.transforms.ValueToKey",
#       "transforms.createKey.fields" : "ATTR_ID ,ATTRVAL_ID, LANGUAGE_ID" 
#     }
#   }
# EOF
# }


#  curl -X DELETE http://localhost:8083/connectors/db2_attr_all
# # Configure kafka connect : db2_catentry
# curl -i \
# -H "Content-Type:application/json" \
# -X POST --data "$(db2_attr_all)" "http://localhost:8083/connectors"

# db2_attr_json()
# {
#   cat <<EOF
#   {
#     "name": "db2_attr",
#     "config": {
#       "connector.class": "io.confluent.connect.jdbc.JdbcSourceConnector",
#       "connection.url": "jdbc:db2://host.docker.internal:50000/testdb",
#       "connection.user": "db2inst1",
#       "connection.password": "password",
#       "topic.prefix": "db2.attr",
#       "mode": "bulk", 
#       "query": "SELECT a.ATTR_ID  ,  a.IDENTIFIER AS ATTRIDENTIFIER , a.ATTRTYPE_ID ,  a.ATTRDICT_ID , \
#           a.STOREENT_ID , a.SEQUENCE AS ATTRSEQUENCE,  a.DISPLAYABLE ,  a.SEARCHABLE , \
#           a.COMPARABLE , a.ATTRUSAGE , a.STOREDISPLAY ,  a.FACETABLE , a.MERCHANDISABLE , \
#           a.SWATCHABLE , b.ATTRVAL_ID ,   c.VALUSAGE ,   c.LANGUAGE_ID ,  c.VALUSAGE , c.SEQUENCE AS VALSEQUENCE,  \
#           c.INTEGERVALUE , c.FLOATVALUE , c.QTYUNIT_ID  , \
#           c.VALUE AS VALVALUE , c.STRINGVALUE, b.IDENTIFIER AS VALIDENTIFIER \
#           FROM DB2ADMIN.ATTR a \
#           LEFT JOIN DB2ADMIN.ATTRVAL b on a.ATTR_ID = b.ATTR_ID  \
#           LEFT JOIN DB2ADMIN.ATTRVALDESC c on a.ATTR_ID = c.ATTR_ID AND b.ATTRVAL_ID = c.ATTRVAL_ID ",
#       "schema.pattern" : "DB2ADMIN",  
#       "key.converter": "org.apache.kafka.connect.json.JsonConverter",
#       "key.converter.schemas.enable": "false",
#       "value.converter": "org.apache.kafka.connect.json.JsonConverter",
#       "value.converter.schemas.enable": "false",
#       "transforms": "createKey",
#       "transforms.createKey.type": "org.apache.kafka.connect.transforms.ValueToKey",
#       "transforms.createKey.fields" : "ATTR_ID ,ATTRVAL_ID, LANGUAGE_ID" 
#     }
#   }
# EOF
# }


#  curl -X DELETE http://localhost:8083/connectors/db2_attr_json
# # Configure kafka connect : db2_catentry
# curl -i \
# -H "Content-Type:application/json" \
# -X POST --data "$(db2_attr_json)" "http://localhost:8083/connectors"


# db2_attr()
# {
#   cat <<EOF
#   {
#     "name": "db2_attr",
#     "config": {
#       "connector.class": "io.confluent.connect.jdbc.JdbcSourceConnector",
#       "connection.url": "jdbc:db2://host.docker.internal:50000/testdb",
#       "connection.user": "db2inst1",
#       "connection.password": "password",
#       "topic.prefix": "db2_attr",
#       "mode":"bulk",
#       "query":"SELECT * FROM DB2ADMIN.ATTR ",  
#       "key.converter": "org.apache.kafka.connect.storage.StringConverter",
#       "key.converter.schemas.enable": "false",
#       "transforms": "createKey,extractInt",
#       "transforms.createKey.type": "org.apache.kafka.connect.transforms.ValueToKey",
#       "transforms.createKey.fields" : "ATTR_ID",
#       "transforms.extractInt.type" : "org.apache.kafka.connect.transforms.ExtractField\$Key",
#       "transforms.extractInt.field" : "ATTR_ID"
#     }
#   }
# EOF
# }
#  curl -X DELETE http://localhost:8083/connectors/db2_attr 
# # Configure kafka connect : db2_catentry
# curl -i \
# -H "Content-Type:application/json" \
# -X POST --data "$(db2_attr)" "http://localhost:8083/connectors"

