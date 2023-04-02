VERSION ?= $(shell cat VERSION)

IMG_REPO ?= dokify
IMG_TAG ?= $(VERSION)
IMG_NAME ?= grpc-php-alpine

GRPC_RELEASE ?= v1.53.0
DOCKERFILE ?= Dockerfile.alpine

default: image

image:
	docker build -t $(IMG_REPO)/$(IMG_NAME):$(IMG_TAG) -f $(DOCKERFILE) \
	--build-arg GRPC_RELEASE=$(GRPC_RELEASE) \
	.

push:
	docker push $(IMG_REPO)/$(IMG_NAME):$(IMG_TAG)