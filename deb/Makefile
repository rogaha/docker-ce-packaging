ARCH:=amd64
ENGINE_DIR:=$(HOME)/go/src/github.com/docker/docker
CLI_DIR:=$(HOME)/go/src/github.com/docker/cli
RUN_FLAGS:=-e ENGINE_DIR$(ENGINE_DIR) -e $(CLI_DIR)
GITCOMMIT=$(shell cd $(ENGINE_DIR) && git rev-parse --short HEAD)
VERSION=$(shell cat $(ENGINE_DIR)/VERSION)
DOCKER_EXPERIMENTAL=0

.PHONY: ubuntu-xenial ubuntu-trusty ubuntu-yakkety ubuntu-zesty debian-jessie debian-stretch debian-wheezy

ubuntu-xenial:
	docker build -t debbuild-$@/$(ARCH) -f $(CURDIR)/$@/Dockerfile.$(ARCH) .
	rm -rf $(CURDIR)/$@/build
	mkdir -p $(CURDIR)/$@/build
	docker run \
		--rm \
		-e DOCKER_GITCOMMIT=$(GITCOMMIT) \
		-v $(CURDIR)/$@/build:/build \
		-v $(ENGINE_DIR):/engine \
		-v $(CLI_DIR):/cli \
		-it \
		debbuild-$@/$(ARCH)

ubuntu-trusty:
	docker build -t debbuild-$@/$(ARCH) -f $(CURDIR)/$@/Dockerfile.$(ARCH) .
	rm -rf $(CURDIR)/$@/build
	mkdir -p $(CURDIR)/$@/build
	docker run \
		--rm \
		-v $(CURDIR)/$@/build:/build \
		-v $(ENGINE_DIR):/engine \
		-v $(CLI_DIR):/cli \
		-it \
		debbuild-$@/$(ARCH)

ubuntu-yakkety:
	docker build -t debbuild-$@/$(ARCH) -f $(CURDIR)/$@/Dockerfile.$(ARCH) .
	rm -rf $(CURDIR)/$@/build
	mkdir -p $(CURDIR)/$@/build
	docker run \
		--rm \
		-v $(CURDIR)/$@/build:/build \
		-v $(ENGINE_DIR):/engine \
		-v $(CLI_DIR):/cli \
		-it \
		debbuild-$@/$(ARCH)

ubuntu-zesty:
	docker build -t debbuild-$@/$(ARCH) -f $(CURDIR)/$@/Dockerfile.$(ARCH) .
	rm -rf $(CURDIR)/$@/build
	mkdir -p $(CURDIR)/$@/build
	docker run \
		--rm \
		-v $(CURDIR)/$@/build:/build \
		-v $(ENGINE_DIR):/engine \
		-v $(CLI_DIR):/cli \
		-it \
		debbuild-$@/$(ARCH)

debian-jessie:
	docker build -t debbuild-$@/$(ARCH) -f $(CURDIR)/$@/Dockerfile.$(ARCH) .
	rm -rf $(CURDIR)/$@/build
	mkdir -p $(CURDIR)/$@/build
	docker run \
		--rm \
		-v $(CURDIR)/$@/build:/build \
		-v $(ENGINE_DIR):/engine \
		-v $(CLI_DIR):/cli \
		-it \
		debbuild-$@/$(ARCH)

debian-stretch:
	docker build -t debbuild-$@/$(ARCH) -f $(CURDIR)/$@/Dockerfile.$(ARCH) .
	rm -rf $(CURDIR)/$@/build
	mkdir -p $(CURDIR)/$@/build
	docker run \
		--rm \
		-v $(CURDIR)/$@/build:/build \
		-v $(ENGINE_DIR):/engine \
		-v $(CLI_DIR):/cli \
		-it \
		debbuild-$@/$(ARCH)

debian-wheezy:
	docker build -t debbuild-$@/$(ARCH) -f $(CURDIR)/$@/Dockerfile.$(ARCH) .
	rm -rf $(CURDIR)/$@/build
	mkdir -p $(CURDIR)/$@/build
	docker run \
		--rm \
		-v $(CURDIR)/$@/build:/build \
		-v $(ENGINE_DIR):/engine \
		-v $(CLI_DIR):/cli \
		-it \
		debbuild-$@/$(ARCH)
