#!/bin/bash

set -m

/entrypoint.sh couchbase-server &

sleep 10

couchbase-cli cluster-init -c 127.0.0.1 --cluster-username Administrator --cluster-password password --services data,index,query --cluster-ramsize 1024 --cluster-index-ramsize 512
couchbase-cli bucket-create -c 127.0.0.1:8091 -u Administrator -p password --bucket=housekeepingtitles --bucket-type=couchbase --bucket-port=11222 --bucket-ramsize=200 --bucket-replica=1
couchbase-cli user-manage -c 127.0.0.1:8091 -u Administrator -p password --set --rbac-username housekeepingtitles --rbac-password password --rbac-name "housekeepingtitles" --roles bucket_admin[housekeepingtitles] --auth-domain local
cbq -u housekeepingtitles -p password -e http://localhost:8093 -s="CREATE PRIMARY INDEX ON housekeepingtitles"

fg 1
