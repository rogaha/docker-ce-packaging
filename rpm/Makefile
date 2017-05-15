ARCH:=amd64
TGZ_BUILD_IMAGE=ubuntu:xenial
ENGINE_DIR:=$(HOME)/go/src/github.com/docker/docker
CLI_DIR:=$(HOME)/go/src/github.com/docker/cli
GITCOMMIT=$(shell cd $(ENGINE_DIR) && git rev-parse --short HEAD)
VERSION=$(shell cat $(ENGINE_DIR)/VERSION)
DOCKER_EXPERIMENTAL=0
BUNDLES_DIR:=$(CURDIR)/bundles
RPMBUILD=docker run --privileged --rm -w /root/rpmbuild \
	-v $(BUNDLES_DIR)/$@/SOURCES:/root/rpmbuild/SOURCES \
	-v $(BUNDLES_DIR)/$@/RPMS:/root/rpmbuild/RPMS \
	-v $(BUNDLES_DIR)/$@/SRPMS:/root/rpmbuild/SRPMS
RPMBUILD_FLAGS=-ba\
	--define '_gitcommit $(GITCOMMIT)' \
	--define '_release 0.0.20170515.000000.git$(GITCOMMIT)' \
	--define '_version 17.06.0' \
	--define '_origversion $(VERSION)' \
	--define '_experimental $(DOCKER_EXPERIMENTAL)' \
	SPECS/docker-ce.spec

tgz:
	@mkdir -p $(BUNDLES_DIR)/$(MAKECMDGOALS)/SOURCES
	@echo "Creating $(BUNDLES_DIR)/$(MAKECMDGOALS)/SOURCES/cli.tgz from $(CLI_DIR)"
	@docker run \
		--rm \
		--entrypoint=/bin/tar \
		-v $(CLI_DIR):/cli \
		-v $(BUNDLES_DIR)/$(MAKECMDGOALS)/SOURCES:/v \
		-w /v \
		$(TGZ_BUILD_IMAGE) \
		-c -z -C / -f /v/cli.tgz cli
	@echo "Creating $(BUNDLES_DIR)/$(MAKECMDGOALS)/SOURCES/engine.tgz from $(ENGINE_DIR)"
	@docker run \
		--rm \
		--entrypoint=/bin/tar \
		-v $(ENGINE_DIR):/engine \
		-v $(BUNDLES_DIR)/$(MAKECMDGOALS)/SOURCES:/v \
		-w /v \
		$(TGZ_BUILD_IMAGE) \
		-c -z -C / -f /v/engine.tgz engine

rpm: centos-7 fedora-24 fedora-25

clean_target:
	rm -rf build

centos-7: clean_target tgz
	docker build -t rpmbuild-$(MAKECMDGOALS)/$(ARCH) -f $(CURDIR)/$(MAKECMDGOALS)/Dockerfile.$(ARCH) $@
	$(RPMBUILD) -it rpmbuild-$(MAKECMDGOALS)/$(ARCH) $(RPMBUILD_FLAGS)

fedora-24: clean_target tgz
	docker build -t rpmbuild-$(MAKECMDGOALS)/$(ARCH) -f $(CURDIR)/$(MAKECMDGOALS)/Dockerfile.$(ARCH) $@
	$(RPMBUILD) -it rpmbuild-$(MAKECMDGOALS)/$(ARCH) $(RPMBUILD_FLAGS)

fedora-25: clean_target tgz
	docker build -t rpmbuild-$(MAKECMDGOALS)/$(ARCH) -f $(CURDIR)/$(MAKECMDGOALS)/Dockerfile.$(ARCH) $@
	$(RPMBUILD) -it rpmbuild-$(MAKECMDGOALS)/$(ARCH) $(RPMBUILD_FLAGS)
