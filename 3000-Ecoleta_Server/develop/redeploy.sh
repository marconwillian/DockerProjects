#!/bin/sh

docker images | awk '(NR>1) && ($2!~/none/) {print $1":"$2}' | xargs -L1 docker pull
docker-compose pull
docker-compose up -d
docker system prune --all --force --volumes