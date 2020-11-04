FROM ubuntu:18.04

ENV DEBIAN_FRONTEND=noninteractive

USER root
WORKDIR /app

SHELL [ "/bin/bash", "-c" ]

RUN apt-get update && apt-get install -yq --no-install-recommends gnupg \
    && apt-get update && apt-get install -yq --no-install-recommends \
       git \
       ca-certificates \
       gradle \
    && cd /tmp \
    && git clone https://gitlab.com/pdftk-java/pdftk \
    && cd pdftk  \
    && git checkout v3.0.0 \
    && gradle wrapper --gradle-version 4.8 \
    && ./gradlew shadowJar \
    && cp build/libs/pdftk-all.jar /usr/local/sbin/ \
    && rm /tmp/* -rf \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

COPY pdftk /usr/local/bin/
