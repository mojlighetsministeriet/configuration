#!/bin/sh


docker stack rm services
docker stack rm persistence
docker stack rm traefik

docker network rm proxy
