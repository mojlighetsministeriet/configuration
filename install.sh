#!/bin/sh

docker swarm init

docker network create -d overlay proxy

docker stack deploy -c docker-compose.traefik.yml traefik
docker stack deploy -c docker-compose.persistence.yml persistence
docker stack deploy -c docker-compose.services.yml services
