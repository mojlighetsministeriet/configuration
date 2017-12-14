#!/bin/sh

docker swarm init

docker network create -d overlay proxy

docker stack deploy --resolve-image=never -c docker-compose.traefik.arm64.yml traefik
docker stack deploy --resolve-image=never -c docker-compose.persistence.arm64.yml persistence
docker stack deploy --resolve-image=never -c docker-compose.services.arm64.yml services
