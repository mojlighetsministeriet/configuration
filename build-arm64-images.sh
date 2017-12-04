#!/bin/sh
set -e

images=(gui identity-provider groups email random-background)
# TODO: fixure out how to run letsencrypt with in arm64 emulation

for image in ${images[@]}; do
  cd ..
  cd $image
  git pull
  docker build -t mojlighetsministeriet/$image-arm64:latest --file arm64.Dockerfile .
  docker push mojlighetsministeriet/$image-arm64:latest
done
