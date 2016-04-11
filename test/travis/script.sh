#!/bin/bash

set -uo pipefail

case "$TRAVIS_OS_NAME" in
  linux)
    docker run -i java_trusty   2> result-ubuntu14.04
    docker run -i java_precise  2> result-ubuntu12.04
    docker run -i java_jessie   2> result-debian8
    docker run -i java_wheezy   2> result-debian7
    docker run -i java_centos7  2> result-centos7
    docker run -i java_centos6  2> result-centos6

    echo "==> Validating the test results..."
    sh -c "[ -s result-ubuntu14.04 ]"
    sh -c "[ -s result-ubuntu12.04 ]"
    sh -c "[ -s result-debian8     ]"
    sh -c "[ -s result-debian7     ]"
    sh -c "[ -s result-centos7     ]"
    sh -c "[ -s result-centos6     ]"
  ;;
  osx)
    echo "==> Running tests using ansible-playbook on Mac OS X..."
    ansible-playbook test.yml --extra-vars test_hosts=localhost

    echo "==> Validating the test results..."
    java -version  2> result-macosx
    sh -c "[ -s result-macosx      ]"
  ;;
  *)
    echo "Unknown value of TRAVIS_OS_NAME: '$TRAVIS_OS_NAME'" >&2
    exit 1
esac
