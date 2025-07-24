DOCKER ?= docker
IMAGE_NAME = jellyfin-dev
VERSION = 10.9.0-dev
IMAGE_TAG = $(VERSION)
IMAGE = $(IMAGE_NAME):$(IMAGE_TAG)
BUILD_ARGS = --build-arg JELLYFIN_VERSION=$(VERSION) --build-arg DOTNET_ARCH=linux-x64 --build-arg PACKAGE_ARCH=amd64 --build-arg QEMU_ARCH=x86_64

.PHONY: build
build:
	@$(DOCKER) build -f docker/Dockerfile $(BUILD_ARGS) -t $(IMAGE) .
