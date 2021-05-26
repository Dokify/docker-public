VERSION ?= $(shell cat VERSION)

IMG_REPO ?= dokify
IMG_TAG ?= $(VERSION)
IMG_NAME ?= elasticsearch

default: image

image:
	docker build -t $(IMG_REPO)/$(IMG_NAME):$(IMG_TAG) -f Dockerfile \
	--build-arg ELASTICSEARCH_VERSION=$(IMG_TAG) \
	.

push:
	docker push $(IMG_REPO)/$(IMG_NAME):$(IMG_TAG)
