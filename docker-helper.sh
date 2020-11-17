#!/bin/bash -

# Example: ./docker-helper.sh --build-alpine-base ./Dockerfile alpine-base:0.x

set -e # Exit on error (i.e., "be strict").
set -C # noclobber

if [[ $1 == "--build-alpine-base" ]]; then
  DOCKER_BUILDKIT=1 docker build --cpuset-cpus 0 -f $2 -t $3 .
fi

if [[ $1 == "--push-alpine-base" ]]; then
  docker tag $2 icehook/$2
  docker push icehook/$2
fi
