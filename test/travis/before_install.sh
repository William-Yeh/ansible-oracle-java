#!/bin/bash

set -uo pipefail

case "$TRAVIS_OS_NAME" in
  linux)
    docker info
    docker version

    echo "==> Prefetching .rpm and .tar.gz to '$PWD/files'..."
    docker build  -f test/Dockerfile-prefetch-rpm      -t java_prefetch_rpm .
    docker run    -v $(pwd):/data  java_prefetch_rpm
    docker build  -f test/Dockerfile-prefetch-tarball  -t java_prefetch_tarball .
    docker run    -v $(pwd):/data  java_prefetch_tarball
    sed -i -e 's/^\(java_download_from_oracle:\).*$/\1 false/'  defaults/main.yml

    echo "==> Building test cases..."
    docker build  -f test/Dockerfile-ubuntu14.04  -t java_trusty   .
    docker build  -f test/Dockerfile-ubuntu12.04  -t java_precise  .
    docker build  -f test/Dockerfile-debian8      -t java_jessie   .
    docker build  -f test/Dockerfile-debian7      -t java_wheezy   .
    docker build  -f test/Dockerfile-centos7      -t java_centos7  .
    docker build  -f test/Dockerfile-centos6      -t java_centos6  .
  ;;
  osx)
    echo "==> Installing Ansible using pip on Mac OS X"
    sudo pip install ansible
  ;;
  *)
    echo "Unknown value of TRAVIS_OS_NAME: '$TRAVIS_OS_NAME'" >&2
    exit 1
esac
