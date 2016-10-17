#!/bin/bash

docker build --pull --no-cache -t casualjim/k8s-kubectl:1.4.1 -t casualjim/k8s-kubectl:latest $(dirname "$0")
docker push casualjim/k8s-kubectl:1.4.1
docker push casualjim/k8s-kubectl:latest