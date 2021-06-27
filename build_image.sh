#!/usr/bin/env bash

ETCD_OPERATOR_IMAGE=${ETCD_OPERATOR_IMAGE:-'docker.io/appn/etcd-operator:latest'}

# Install dep as described here https://github.com/golang/dep
curl https://raw.githubusercontent.com/golang/dep/master/install.sh | sh

./hack/build/operator/build
./hack/build/backup-operator/build
./hack/build/restore-operator/build

docker build --no-cache -t $ETCD_OPERATOR_IMAGE -f hack/build/Dockerfile .
