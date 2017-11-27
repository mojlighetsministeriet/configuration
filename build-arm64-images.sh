#!/bin/sh
set -e

images=(gui,identity-provider,groups,email,random-background)

for image in ${images[@]}; do
  cd ..
  cd $image
  git stash
  git pull
  docker build -t mojlighetsministeriet/$image-arm64:latest --file arm64.Dockerfile .
  docker push mojlighetsministeriet/$image-arm64:latest
  git stash pop
done
