VERSION ?= $(shell cat VERSION)

IMG_REPO ?= dokify
IMG_TAG ?= $(VERSION)
IMG_NAME ?= packer

default: image-packer

image-packer:
	docker build -t $(IMG_REPO)/$(IMG_NAME):$(IMG_TAG) -f Dockerfile \
    .

push:
	docker push $(IMG_REPO)/$(IMG_NAME):$(IMG_TAG)