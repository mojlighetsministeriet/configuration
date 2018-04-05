#!/bin/sh

docker network create -d overlay cockroachdb

sudo docker service create \
--replicas 1 \
--name cockroachdb-1 \
--hostname cockroachdb-1 \
--network cockroachdb \
--mount type=volume,source=cockroachdb-1,target=/cockroach/cockroach-data,volume-driver=local \
--stop-grace-period 60s \
--publish 8080:8080 \
mojlighetsministeriet/cockroach-arm64 start \
--join=cockroachdb-1:26257,cockroachdb-2:26257,cockroachdb-3:26257,cockroachdb-4:26257,cockroachdb-5:26257 \
--cache=25% \
--max-sql-memory=25% \
--logtostderr \
--insecure

sudo docker service create \
--replicas 1 \
--name cockroachdb-2 \
--hostname cockroachdb-2 \
--network cockroachdb \
--mount type=volume,source=cockroachdb-2,target=/cockroach/cockroach-data,volume-driver=local \
--stop-grace-period 60s \
--publish 8080:8080 \
mojlighetsministeriet/cockroach-arm64 start \
--join=cockroachdb-1:26257,cockroachdb-2:26257,cockroachdb-3:26257,cockroachdb-4:26257,cockroachdb-5:26257 \
--cache=25% \
--max-sql-memory=25% \
--logtostderr \
--insecure

sudo docker service create \
--replicas 1 \
--name cockroachdb-3 \
--hostname cockroachdb-3 \
--network cockroachdb \
--mount type=volume,source=cockroachdb-3,target=/cockroach/cockroach-data,volume-driver=local \
--stop-grace-period 60s \
--publish 8080:8080 \
mojlighetsministeriet/cockroach-arm64 start \
--join=cockroachdb-1:26257,cockroachdb-2:26257,cockroachdb-3:26257,cockroachdb-4:26257,cockroachdb-5:26257 \
--cache=25% \
--max-sql-memory=25% \
--logtostderr \
--insecure

sudo docker service create \
--replicas 1 \
--name cockroachdb-4 \
--hostname cockroachdb-4 \
--network cockroachdb \
--mount type=volume,source=cockroachdb-4,target=/cockroach/cockroach-data,volume-driver=local \
--stop-grace-period 60s \
--publish 8080:8080 \
mojlighetsministeriet/cockroach-arm64 start \
--join=cockroachdb-1:26257,cockroachdb-2:26257,cockroachdb-3:26257,cockroachdb-4:26257,cockroachdb-5:26257 \
--cache=25% \
--max-sql-memory=25% \
--logtostderr \
--insecure

sudo docker service create \
--replicas 1 \
--name cockroachdb-5 \
--hostname cockroachdb-5 \
--network cockroachdb \
--mount type=volume,source=cockroachdb-5,target=/cockroach/cockroach-data,volume-driver=local \
--stop-grace-period 60s \
--publish 8080:8080 \
mojlighetsministeriet/cockroach-arm64 start \
--join=cockroachdb-1:26257,cockroachdb-2:26257,cockroachdb-3:26257,cockroachdb-4:26257,cockroachdb-5:26257 \
--cache=25% \
--max-sql-memory=25% \
--logtostderr \
--insecure
