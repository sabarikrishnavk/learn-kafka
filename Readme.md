understand kafka and set up kafka connect

## To start kafka cluster

docker-compose -f docker-compose-kafka.yml up -d
docker-compose -f docker-compose-kafka.yml down -d

## To start db2 and elastic search cluster

docker-compose -f docker-compose-es-db2.yml up -d
docker-compose -f docker-compose-es-db2.yml down -d

## Dev steps

Setup db2 locally , follow the instruction inside db2-docker.txt

Setup kakfa with kafka connector to db2 , follow the instruction inside confluent-kafka.txt

## Docker useful commands

List all containers (only IDs) docker ps -aq.
Stop all running containers. docker stop $(docker ps -aq)
Remove all containers. docker rm $(docker ps -aq)
Remove all images. docker rmi $(docker images -q)
