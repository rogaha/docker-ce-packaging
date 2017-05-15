SHELL=/bin/bash
ENGINE_DIR:=engine
CLI_DIR:=cli
VERSION:=$(shell cat $(ENGINE_DIR)/VERSION)
BUNDLES_DIR:=$(CURDIR)/bundles

.PHONY: rpm
DOCKER_BUILD_PKGS=fedora-25 fedora-24 fedora-7
rpm:
	for p in $(DOCKER_BUILD_PKGS); do \
		$(MAKE) -C rpm BUNDLES_DIR=$(BUNDLES_DIR) ENGINE_DIR=$(ENGINE_DIR) CLI_DIR=$(CLI_DIR) $${p}; \
	done

$(CLI_DIR)/build/docker:
	$(MAKE) -C $(CLI_DIR) -f docker.Makefile build

$(ENGINE_DIR)/bundles/$(VERSION)/binary-daemon/dockerd:
	$(MAKE) -C $(ENGINE_DIR) binary

tgz: | $(CLI_DIR)/build/docker $(ENGINE_DIR)/bundles/$(VERSION)/binary-daemon/dockerd
	mkdir -p bundles/tgz/amd64/docker-$(VERSION)
	cp \
		$< \
		$(ENGINE_DIR)/bundles/$(VERSION)/binary-daemon/* \
		bundles/tgz/amd64/docker-$(VERSION)
	tar cvzf bundles/tgz/amd64/docker-$(VERSION).tgz bundles/tgz/amd64/docker-$(VERSION)
