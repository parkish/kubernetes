#!/bin/bash

set -ex

GOVERSION=1.7

pushd ..

# create a passwd file with my identity in it so I don't have to chown all
# the binaries in my source folder
PASSWD_LINE="build:*:$(id -u):$(id -g):build:/tmp:/bin/bash"

docker run -it --rm \
    -v `pwd`:/go/src/k8s.io/kubernetes \
    -e PASSWD_LINE="${PASSWD_LINE}" \
    -w /go/src/k8s.io/kubernetes \
    golang:"${GOVERSION}"     \
    build/run_in_container.sh

