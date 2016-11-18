#!/usr/bin/env bash

if [ $# -ne 1 ]; then
  echo "Usage: $(basename $0) [php_version ]"
fi

docker build -t phpall-builder base

docker run --rm phpall-builder "-v $1" > images.tar.gz
docker build -t hamaco/php-all:$1 .
