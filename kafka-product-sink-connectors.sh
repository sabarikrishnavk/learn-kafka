#!/bin/bash

# Prereqs: docker-compose
#          curl

# elasticsearch-sink 
product_es_sink()
{
  cat <<EOF
  {
    "name": "product_es_sink",
    "config": {
      "connector.class": "io.confluent.connect.elasticsearch.ElasticsearchSinkConnector",
      "tasks.max": "1",
      "connection.url": "http://host.docker.internal:9200",
      "type.name": "_doc",
      "name": "product_es_sink",
      "key.converter": "org.apache.kafka.connect.storage.StringConverter",
      "key.converter.schemas.enable": "false",
      "value.converter": "org.apache.kafka.connect.json.JsonConverter",
      "value.converter.schemas.enable": "false", 
      "key.ignore": "false",
      "schema.ignore": "true",
      "write.method" : "UPSERT",
      "auto.create.indices.at.start": "false"  ,
      "topics": "db2.product.details, db2.product.attributemap", 
      "transforms": "TimestampConverter,createKey,extractKey,renameTopic",
      "transforms.TimestampConverter.type": "org.apache.kafka.connect.transforms.TimestampConverter\$Value",
      "transforms.TimestampConverter.format": "yyyy-MM-dd HH:mm:ss",
      "transforms.TimestampConverter.field": "LASTUPDATE",
      "transforms.TimestampConverter.target.type": "string",    
      "transforms.createKey.type": "org.apache.kafka.connect.transforms.ValueToKey",
      "transforms.createKey.fields": "PARTNUMBER",
      "transforms.extractKey.type": "org.apache.kafka.connect.transforms.ExtractField\$Key",
      "transforms.extractKey.field": "PARTNUMBER" ,
      "transforms.renameTopic.type": "org.apache.kafka.connect.transforms.RegexRouter", 
      "transforms.renameTopic.regex": "db2.product.*",
      "transforms.renameTopic.replacement": "products"  
    }
  } 
EOF
}


curl -X DELETE http://localhost:8083/connectors/product_es_sink
# Configure kafka connect : product_es_sink
curl -i \
-H "Content-Type:application/json" \
-X POST --data "$(product_es_sink)" "http://localhost:8083/connectors"