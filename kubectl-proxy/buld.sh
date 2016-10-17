#!/bin/bash

docker build --pull --no-cache -t casualjim/kubectl-proxy:1.4.1 -t casualjim/kubectl-proxy:latest .
docker push casualjim/kubectl-proxy:1.4.1
docker push casualjim/kubectl-proxy:latest