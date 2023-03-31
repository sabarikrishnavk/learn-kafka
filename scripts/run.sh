#!/bin/bash
set -e 
echo "Connecting to testdb" 
db2 connect to testdb

echo "Executing scripts"
db2 -tvf /scripts/all-scripts.sql 