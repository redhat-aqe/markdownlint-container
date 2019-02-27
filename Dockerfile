# This FROM is for generic container
# The Jenkins slaves still need to originate from the Jenkins slave base image
FROM fedora:latest

# This is a small HACK
# Adds ability to set these during container build in OpenShift
# EXAMPLE: oc start-build --build-arg GIT_COMMIT=0123456789abcdef
ARG GIT_COMMIT=unknown
ARG BUILD_DATE=unknown
ARG VERSION=unknown
ARG GIT_URL=unknown
ARG AUTHORITATIVE_SOURCE=unknown

LABEL description="DevOps AQE markdown linter container" \
      summary="Devops AQE markdown linter container" \
      maintainer="PnT DevOps Automation and QE <pnt-devops-auto@redhat.com>" \
      vendor="PnT DevOps Automation - Red Hat, Inc." \
      distribution-scope="public"

RUN dnf install -y rubygems && \
    gem install mdl && \
    dnf clean all
