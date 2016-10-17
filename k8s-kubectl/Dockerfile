FROM casualjim/base
MAINTAINER Ivan Porto Carrero <ivan@flanders.co.nz> (@casualjim)

ARG VCS_REF
ARG BUILD_DATE

# Metadata
LABEL org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.vcs-url="https://github.com/casualjim/kube-cert-manager" \
      org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.docker.dockerfile="k8s-kubectl/Dockerfile"

ENV KUBE_LATEST_VERSION="v1.4.1"

RUN apk add --no-cache -t deps curl \
 && curl -L'#' https://storage.googleapis.com/kubernetes-release/release/${KUBE_LATEST_VERSION}/bin/linux/amd64/kubectl -o /usr/bin/kubectl \
 && chmod +x /usr/bin/kubectl \
 && apk del --purge deps

ENTRYPOINT ["kubectl"]
CMD ["help"]