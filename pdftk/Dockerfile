FROM ubuntu:18.04

ENV DEBIAN_FRONTEND=noninteractive

USER root
WORKDIR /app

SHELL [ "/bin/bash", "-c" ]

COPY libgcj-common_6.4-3ubuntu1_all.deb /tmp
COPY libgcj14_4.8.5-4ubuntu7_amd64.deb /tmp
COPY pdftk_2.01-1_amd64.deb /tmp

RUN apt-get update && apt-get install -yq --no-install-recommends gnupg \
    && apt-get update && apt-get install -yq --no-install-recommends \
       git \
       ca-certificates \
       python \
       gcc \
    && apt install -fy /tmp/libgcj-common_6.4-3ubuntu1_all.deb \
    && apt install -fy /tmp/libgcj14_4.8.5-4ubuntu7_amd64.deb \
    && apt install -fy /tmp/pdftk_2.01-1_amd64.deb \
    && rm /tmp/* -rf \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

CMD ["pdftk"]
