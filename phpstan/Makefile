VERSION ?= $(shell cat VERSION)

IMG_REPO ?= dokify
IMG_TAG ?= $(VERSION)
IMG_NAME ?= phpstan

default: image

image:
	docker build -t $(IMG_REPO)/$(IMG_NAME):$(IMG_TAG) -f Dockerfile \
	.

push:
	docker push $(IMG_REPO)/$(IMG_NAME):$(IMG_TAG)