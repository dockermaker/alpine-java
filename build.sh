#!/bin/bash

##### Constants
JAVA_VERSION=8
JAVA_UPDATE=151
JAVA_BUILD=12
JAVA_GUID="e758a0de34e24606bca991d704f6dcbf"


if [ "$1" ]
  then
    JAVA_VERSION="$1"
fi

if [ "$2" ]
  then
    JAVA_UPDATE="$2"
fi

if [ "$3" ]
  then
    JAVA_BUILD="$3"
fi

docker build -f Dockerfile-glibc --rm=true -t dockermaker/alpine-glibc .
docker build -f Dockerfile-java --rm=true \
       --build-arg JAVA_VERSION=${JAVA_VERSION} \
       --build-arg JAVA_UPDATE=${JAVA_UPDATE} \
       --build-arg JAVA_BUILD=${JAVA_BUILD} \
       --build-arg JAVA_GUID=${JAVA_GUID} \
        -t dockermaker/alpine-java:${JAVA_VERSION}u${JAVA_UPDATE} .
