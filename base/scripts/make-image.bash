#!/usr/bin/env bash

build() {
  shopt -s extglob

  declare PHP_VERSION="${1##*( )}"

  basedir=/work/images

  mkdir -p $basedir/etc/apk/ $basedir/root/bin/
  cp /etc/apk/repositories $basedir/etc/apk/repositories

  {
    apk add --no-cache --root "$basedir" --keys-dir /etc/apk/keys --initdb libxml2-dev bzip2-dev

    pushd /work/
      wget -O php-$PHP_VERSION.tar.bz2 http://jp2.php.net/get/php-$PHP_VERSION.tar.bz2/from/this/mirror
      /work/phpall/install-all-php.sh
      cp /root/bin/php-$PHP_VERSION $basedir/root/bin/php
    popd
  } >&2

  tar czf images.tar.gz . -C "$basedir"
  cat images.tar.gz

  return 0
}

main() {
  while getopts "v:" opt; do
    case $opt in
      v) VERSION="$OPTARG" ;;
    esac
  done

  build "$VERSION"
}

main "$@"
