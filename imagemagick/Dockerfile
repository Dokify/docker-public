FROM ubuntu:18.04

ENV DEBIAN_FRONTEND=noninteractive

USER root
WORKDIR /app

SHELL [ "/bin/bash", "-c" ]

RUN apt-get update && apt-get install -yq --no-install-recommends \
        imagemagick \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

CMD ["convert"]