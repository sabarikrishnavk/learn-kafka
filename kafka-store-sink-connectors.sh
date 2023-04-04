#!/bin/bash

# Prereqs: docker-compose
#          curl

# elasticsearch-sink 
stores_es_sink()
{
  cat <<EOF
  {
    "name": "stores_es_sink",
    "config": {
      "connector.class": "io.confluent.connect.elasticsearch.ElasticsearchSinkConnector",
      "tasks.max": "1",
      "connection.url": "http://host.docker.internal:9200",
      "type.name": "_doc",
      "name": "stores_es_sink",
      "key.converter": "org.apache.kafka.connect.storage.StringConverter",
      "key.converter.schemas.enable": "false",
      "value.converter": "org.apache.kafka.connect.json.JsonConverter",
      "value.converter.schemas.enable": "false", 
      "key.ignore": "false",
      "schema.ignore": "true",
      "write.method" : "UPSERT",
      "auto.create.indices.at.start": "false"  ,
      "topics": "db2.store.details, db2.store.attributemap", 
      "transforms": "createKey,extractKey,renameTopic",   
      "transforms.createKey.type": "org.apache.kafka.connect.transforms.ValueToKey",
      "transforms.createKey.fields": "IDENTIFIER",
      "transforms.extractKey.type": "org.apache.kafka.connect.transforms.ExtractField\$Key",
      "transforms.extractKey.field": "IDENTIFIER" ,
      "transforms.renameTopic.type": "org.apache.kafka.connect.transforms.RegexRouter", 
      "transforms.renameTopic.regex": "db2.store.*",
      "transforms.renameTopic.replacement": "stores"  
    }
  } 
EOF
}


curl -X DELETE http://localhost:8083/connectors/stores_es_sink
# Configure kafka connect : elasticsearch_sink
curl -i \
-H "Content-Type:application/json" \
-X POST --data "$(stores_es_sink)" "http://localhost:8083/connectors"