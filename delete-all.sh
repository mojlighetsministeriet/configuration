#!/bin/sh

docker network rm proxy

docker stack rm traefik
docker stack rm persistence
docker stack rm services
