VERSION ?= $(shell cat VERSION)

IMG_REPO ?= dokify
IMG_TAG ?= $(VERSION)
IMG_NAME ?= liquibase-mongodb
LIQUIBASE_VERSION ?= 4.11

default: image

image:
	docker build -t $(IMG_REPO)/$(IMG_NAME):$(IMG_TAG) -f Dockerfile \
	--build-arg LIQUIBASE_VERSION=$(LIQUIBASE_VERSION) \
	.

push:
	docker push $(IMG_REPO)/$(IMG_NAME):$(IMG_TAG)