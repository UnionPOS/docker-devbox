-include $(shell curl -sSL -o .build-harness "https://raw.githubusercontent.com/unionpos/build-harness/master/templates/Makefile.build-harness"; echo .build-harness)

export DOCKER_ORG ?= unionpos
export DOCKER_IMAGE ?= $(DOCKER_ORG)/devbox
export DOCKER_TAG ?= 0.0.1
export DOCKER_IMAGE_NAME ?= $(DOCKER_IMAGE):$(DOCKER_TAG)
export DOCKER_BUILD_FLAGS =

build: docker/build

## update readme documents
docs: readme/deps readme
.PHONY: docs

run:
	docker container run --rm --attach STDOUT ${DOCKER_IMAGE_NAME}

it:
	docker run -it ${DOCKER_IMAGE_NAME} /bin/zsh -l
	# -l is needed to load shell rc files on login
