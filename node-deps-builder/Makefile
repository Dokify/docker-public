VERSION ?= $(shell cat VERSION)

IMG_REPO ?= dokify
IMG_TAG ?= $(VERSION)
IMG_NAME ?= node-deps-builder
NODE_VERSION := 18

default: image

image:
	docker build -t $(IMG_REPO)/$(IMG_NAME):$(IMG_TAG) -f Dockerfile \
	--build-arg NODE_VERSION=$(NODE_VERSION) \
	.

push:
	docker push $(IMG_REPO)/$(IMG_NAME):$(IMG_TAG)
