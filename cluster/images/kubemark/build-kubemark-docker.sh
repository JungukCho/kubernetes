#!/bin/bash

KUBEMARK="kubemark"
# compile kubemark
go build -o $KUBEMARK ../../../cmd/kubemark/hollow-node.go

# create docker container which contains compiled kubemark binary
make build

# rename image and push the image to acnpublic repo
KUBEMARK_IMAGE_NAME="acnpublic.azurecr.io/kubemark:randomips"
docker tag staging-k8s.gcr.io/kubemark:latest $KUBEMARK_IMAGE_NAME
docker push $KUBEMARK_IMAGE_NAME

# clean-up kubemark
rm $KUBEMARK
