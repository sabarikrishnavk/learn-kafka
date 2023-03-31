#!/bin/bash

# Prereqs: docker-compose
#          curl

db2_catentry_details()
{
  cat <<EOF
  {
    "name": "db2_catentry_details",
    "config": {
      "connector.class": "io.confluent.connect.jdbc.JdbcSourceConnector",
      "connection.url": "jdbc:db2://host.docker.internal:50000/testdb",
      "connection.user": "db2inst1",
      "connection.password": "password",
      "topic.prefix": "db2.product.details",
      "mode":"timestamp",
      "query":"SELECT CATENTRY_ID, MEMBER_ID, PARTNUMBER, LASTUPDATE FROM DB2ADMIN.CATENTRY ",
      "timestamp.column.name": "LASTUPDATE",
      "validate.non.null": false,
      "key.converter": "org.apache.kafka.connect.json.JsonConverter",
      "key.converter.schemas.enable": "false",
      "value.converter": "org.apache.kafka.connect.json.JsonConverter",
      "value.converter.schemas.enable": "false",
      "transforms": "createKey,extractKey",
      "transforms.createKey.type": "org.apache.kafka.connect.transforms.ValueToKey",
      "transforms.createKey.fields" : "PARTNUMBER",
      "transforms.extractKey.type" : "org.apache.kafka.connect.transforms.ExtractField\$Key",
      "transforms.extractKey.field" : "PARTNUMBER"
    }
  }
EOF
} 
curl -X DELETE http://localhost:8083/connectors/db2_catentry_details
# Configure kafka connect : db2_catentry
curl -i \
-H "Content-Type:application/json" \
-X POST --data "$(db2_catentry_details)" "http://localhost:8083/connectors"

 
db2_catentry_attribute()
{
  cat <<EOF
  {
    "name": "db2_catentry_attribute",
    "config": {
      "connector.class": "io.confluent.connect.jdbc.JdbcSourceConnector",
      "connection.url": "jdbc:db2://host.docker.internal:50000/testdb",
      "connection.user": "db2inst1",
      "connection.password": "password",
      "topic.prefix": "db2.product.attributes",
      "mode":"timestamp",
      "query":"SELECT CATENTRY_ID, PARTNUMBER, LASTUPDATE ,CAST(attr_id as varchar) attr_id, attr_value \
              FROM ((select ca.CATENTRY_ID , ce.PARTNUMBER, ce.LASTUPDATE , \
              avd.attr_id as attr_id, avd.stringvalue as attr_value \
              from DB2ADMIN.catentryattr ca ,DB2ADMIN.attrvaldesc avd, DB2ADMIN.catentry CE \
              where ca.catentry_id = CE.catentry_id \
              and avd.attrval_id = ca.attrval_id ) \
              UNION \
              (select rel.catentry_id_parent CATENTRY_ID, c.PARTNUMBER, c.LASTUPDATE , \
              avd.attr_id as attr_id, avd.stringvalue as attr_value \
              from DB2ADMIN.catentryattr ca, DB2ADMIN.attrvaldesc avd, DB2ADMIN.catentry c, DB2ADMIN.CATENTREL rel \
              where c.catentry_id=rel.catentry_id_parent \
              and c.catenttype_id='ProductBean' and rel.catreltype_id='PRODUCT_ITEM' \
              and rel.catentry_id_child = ca.catentry_id \
              and avd.attrval_id = ca.attrval_id ))  ",

      "timestamp.column.name": "LASTUPDATE",
      "validate.non.null": false,
      "key.converter": "org.apache.kafka.connect.json.JsonConverter",
      "key.converter.schemas.enable": "false",
      "value.converter": "org.apache.kafka.connect.json.JsonConverter",
      "value.converter.schemas.enable": "false",
      "transforms": "createKey",
      "transforms.createKey.type": "org.apache.kafka.connect.transforms.ValueToKey",
      "transforms.createKey.fields" : "PARTNUMBER, ATTR_ID" 
    }
  }
EOF
}


curl -X DELETE http://localhost:8083/connectors/db2_catentry_attribute
# Configure kafka connect : db2_catentry
curl -i \
-H "Content-Type:application/json" \
-X POST --data "$(db2_catentry_attribute)" "http://localhost:8083/connectors"
 