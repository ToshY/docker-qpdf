FROM ubuntu:22.04

ARG APPLICATION_VERSION

LABEL maintainer="ToshY <github.com/ToshY>"

RUN <<EOT sh
  set -ex
  apt-get update
  apt-get install -y wget unzip
  adduser --disabled-password --no-create-home --gecos "" qpdf
  wget --retry-on-host-error --retry-on-http-error=429,500,502,503 -O /usr/local/qpdf.zip "https://github.com/qpdf/qpdf/releases/download/v$APPLICATION_VERSION/qpdf-$APPLICATION_VERSION-bin-linux-x86_64.zip"
  unzip /usr/local/qpdf.zip -d /usr/local/
  rm /usr/local/qpdf.zip
  apt-get --purge remove -y wget unzip
  apt-get clean
  rm -rf /var/lib/apt/lists/*
EOT

USER qpdf

WORKDIR /pdf

ENTRYPOINT ["/usr/local/bin/qpdf"]
