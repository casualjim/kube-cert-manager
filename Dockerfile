FROM casualjim/base:latest
MAINTAINER Ivan Porto Carrero <ivan@flanders.co.nz> (@casualjim)

ADD kube-cert-manager /kube-cert-manager

VOLUME ["/var/lib/cert-manager"]
VOLUME ["/etc/secrets"]

ENTRYPOINT ["/kube-cert-manager"]
