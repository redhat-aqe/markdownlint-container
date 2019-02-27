# This FROM is for generic container
# The Jenkins slaves still need to originate from the Jenkins slave base image
FROM fedora:latest

LABEL description="DevOps AQE markdown linter container" \
      summary="Devops AQE markdown linter container" \
      maintainer="PnT DevOps Automation and QE <pnt-devops-auto@redhat.com>" \
      vendor="PnT DevOps Automation - Red Hat, Inc." \
      distribution-scope="public"

RUN dnf install -y rubygems && \
    gem install mdl && \
    dnf clean all
