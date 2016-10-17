#!/bin/bash

set -e -o pipefail

version=${1-"latest"}

brwhte="$(tput setaf 15)"
bryllw="$(tput setaf 11)"
creset="$(tput sgr0)"
yarrow="${bryllw}=>${creset}"

build_binary() {
  set -u
  echo -e "${yarrow} building binary ${brwhte}kube-cert-manager${creset}"
  docker run --rm -it -v `pwd`:/go/src/github.com/casualjim/kube-cert-manager -w /go/src/github.com/casualjim/kube-cert-manager  casualjim/builder "$@"
}

publish() {
  set -u
  echo -e "${yarrow} publishing ${brwhte}kube-cert-manager${creset}"
  docker build --pull --no-cache -q -t casualjim/kube-cert-manager:$version .
  docker push casualjim/kube-cert-manager:$version
}

set +u
if [ -z "${PUBLISH_ONLY}" ]; then 
  build_binary go get ./... && go build -o kube-cert-manager -a -ldflags '-w -linkmode external -extldflags "-static"' .
fi

set +u
[ -z "${BUILD_ONLY}" ] && publish
