#!/bin/sh

docker swarm init

docker network create -d overlay proxy

docker stack deploy -c docker-compose.traefik-arm64.yml traefik
docker stack deploy -c docker-compose.persistence-arm-64.yml persistence
docker stack deploy -c docker-compose.services-arm64.yml services
