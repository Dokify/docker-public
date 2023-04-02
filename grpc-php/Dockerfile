FROM php:8.2-buster as grpc-base
ARG GRPC_RELEASE=v1.53.0

RUN apt-get -yq update && apt-get -qq install -y \
  autoconf automake curl git libtool \
  pkg-config unzip zlib1g-dev make gcc g++ cmake

ARG MAKEFLAGS=-j8

WORKDIR /github/grpc

RUN git clone --depth 1 --branch ${GRPC_RELEASE} https://github.com/grpc/grpc \
    && cd grpc && git submodule update --init \
    && mkdir -p cmake/build \
    && cd cmake/build \
    && cmake ../.. \
    && make protoc grpc_php_plugin \


