#!/usr/bin/env bash

go get github.com/tools/godep

echo $PASSWD_LINE >> /etc/passwd
su -c "PATH=$PATH /go/bin/godep go build k8s.io/kubernetes/cmd/kubectl" build
