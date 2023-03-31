understand kafka and set up kafka connect

## To start/stop db2 and elastic search cluster

docker-compose -f docker-compose-es-db2.yml up -d
docker-compose -f docker-compose-es-db2.yml down

## To start/stop kafka cluster

docker-compose -f docker-compose-kafka.yml up -d
docker-compose -f docker-compose-kafka.yml down

## After db2 servers are started, from the learn-kafka path

``
docker cp scripts/ db2:/scripts/

docker exec -it db2 /bin/bash -c "chown root /scripts/"
docker exec -it db2 /bin/bash -c "cat /scripts/02-\*.sql > /scripts/02-ddl.sql"
docker exec -it db2 /bin/bash -c "su - db2inst1"
. /scripts/run.sh
exit
``

## Setup the db2 source connector to pull data from db2 to kafka

curl -X POST http://localhost:8083/connectors -H "Content-Type: application/json" -d '{
"name": "jdbc_source_db2_01",
"config": {
"connector.class": "io.confluent.connect.jdbc.JdbcSourceConnector",
"connection.url": "jdbc:db2://host.docker.internal:50000/testdb",
"connection.user": "db2inst1",
"connection.password": "password",
"topic.prefix": "db2-02-catentry",
"mode":"timestamp",
"query":"SELECT CATENTRY_ID, MEMBER_ID, PARTNUMBER, LASTUPDATE FROM DB2ADMIN.CATENTRY ",
"timestamp.column.name": "LASTUPDATE",
"validate.non.null": false,
"key.converter": "org.apache.kafka.connect.json.JsonConverter",
"key.converter.schemas.enable": "false",
"value.converter": "org.apache.kafka.connect.json.JsonConverter",
"value.converter.schemas.enable": "false",
"transforms": "createKey,extractInt",
"transforms.createKey.type": "org.apache.kafka.connect.transforms.ValueToKey",
"transforms.createKey.fields" : "CATENTRY_ID",
"transforms.extractInt.type" : "org.apache.kafka.connect.transforms.ExtractField$Key",
"transforms.extractInt.field" : "CATENTRY_ID"
}
}'

## To check the messages in kafka topic

http://localhost:9021/

## To create a elastic search sink connector

``
curl -X POST http://localhost:8083/connectors -H "Content-Type: application/json" -d '{
"name": "elasticsearch-sink",
"config": {
"connector.class": "io.confluent.connect.elasticsearch.ElasticsearchSinkConnector",
"tasks.max": "1",
"topics": "db2-02-catentry",
"key.ignore": "true",
"schema.ignore": "true",
"connection.url": "http://host.docker.internal:9200",
"type.name": "\_doc",
"name": "elasticsearch-sink",
"key.converter": "org.apache.kafka.connect.json.JsonConverter",
"key.converter.schemas.enable": "false",
"value.converter": "org.apache.kafka.connect.json.JsonConverter",
"value.converter.schemas.enable": "false",
"write.method" : "UPSERT",
"transforms": "TimestampConverter",
"transforms.TimestampConverter.type": "org.apache.kafka.connect.transforms.TimestampConverter$Value",
"transforms.TimestampConverter.format": "yyyy-MM-dd HH:mm:ss",
"transforms.TimestampConverter.field": "LASTUPDATE",
"transforms.TimestampConverter.target.type": "string"
}
}'

`

## Elastic search index search

http://localhost:9200/db2-02-catentry/\_search?pretty

## To delete the source/sink connector

curl -X DELETE http://localhost:8083/connectors/jdbc_source_db2_01
curl -X DELETE http://localhost:8083/connectors/elasticsearch-sink

## ksqldb queries

docker exec -it ksqldb-cli ksql http://ksqldb-server:8088

ksql> SET 'auto.offset.reset' = 'earliest';

CREATE STREAM catentry_stream (CATENTRY_ID VARCHAR KEY, MEMBER_ID VARCHAR, PARTNUMBER VARCHAR , LASTUPDATE VARCHAR)
WITH (KAFKA_TOPIC = 'db2-02-catentry',
VALUE_FORMAT = 'JSON',
TIMESTAMP = 'LASTUPDATE',
TIMESTAMP_FORMAT = 'yyyy-MM-dd HH:mm:ss');
,
PARTITIONS = 1);

## Docker useful commands

List all containers (only IDs) docker ps -aq.
Stop all running containers. docker stop $(docker ps -aq)
Delete all containers using the following command: docker rm -f $(docker ps -a -q)
Delete all volumes using the following command: docker volume rm $(docker volume ls -q)
Remove all images (Dont execute this unless and until you need a fresh start with docker image download) docker rmi $(docker images -q)

## Dev steps

Setup db2 locally , follow the instruction inside db2-docker.txt

Setup kakfa with kafka connector to db2 , follow the instruction inside confluent-kafka.txt

Sample AVRO:

"key.converter": "io.confluent.connect.avro.AvroConverter",
"key.converter.schema.registry.url": "http://schema-registry:8081",
"value.converter": "io.confluent.connect.avro.AvroConverter",
"value.converter.schema.registry.url": "http://schema-registry:8081",

Sample JSON:
"key.converter": "org.apache.kafka.connect.json.JsonConverter",
"key.converter.schemas.enable": "false",

bigint size : m
