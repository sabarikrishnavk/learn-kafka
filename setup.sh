#!/bin/bash

# Prereqs: docker-compose
#          curl
 
# Restart everything from empty. The yaml file defining the
# containers has no persistent volumes.

docker-compose -f docker-compose-kafka.yml down
docker-compose -f docker-compose-es-db2.yml down

echo "remove all containers and volumes"
docker rm -f $(docker ps -a -q)
docker volume rm $(docker volume ls -q)

docker-compose -f docker-compose-es-db2.yml up -d
docker-compose -f docker-compose-kafka.yml up -d

# Give it a chance to start
echo "Waiting for 180 seconds..."
sleep 180

docker cp scripts/ db2:/scripts/

docker cp ksql/ ksqldb-cli:/ksql/

docker exec -it db2 /bin/bash -c "chown root /scripts/"
docker exec -it db2 /bin/bash -c "cat /scripts/*.sql > /scripts/all-scripts.sql" 
docker exec -it db2 /bin/bash -c "su - db2inst1 -c '. /scripts/run.sh' "

## docker exec -it db2 /bin/bash -c "su - db2inst1"
## . /scripts/run.sh

. kafka-product-source-connectors.sh
. kafka-store-source-connectors.sh

##. kafka-bulk-connectors.sh
##docker exec -it ksqldb-cli ksql http://ksqldb-server:8088 --file '/ksql/bulk-table.sql'

docker exec -it ksqldb-cli ksql http://ksqldb-server:8088 --file '/ksql/product-streams.sql'
docker exec -it ksqldb-cli ksql http://ksqldb-server:8088 --file '/ksql/store-streams.sql'

. kafka-product-sink-connectors.sh
. kafka-store-sink-connectors.sh