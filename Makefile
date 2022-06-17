#
#  Author: Hari Sekhon
#  Date: 2022-06-14 11:11:23 +0100 (Tue, 14 Jun 2022)
#
#  vim:ts=4:sts=4:sw=4:noet
#
#  https://github.com/HariSekhon/GitHub-Actions
#
#  If you're using my code you're welcome to connect with me on LinkedIn and optionally send me feedback to help steer this or other code I publish
#
#  https://www.linkedin.com/in/HariSekhon
#

# For serious Makefiles see the DevOps Bash tools repo:
#
#	https://github.com/HariSekhon/DevOps-Bash-tools
#
#	Makefile
#	Makefile.in - generic include file with lots of Make targets


# only works in GNU make - is ignored by Mac's built-in make - not portable, should avoid and call bash scripts instead
#.ONESHELL:
# make oneshell exit on first error
#.SHELLFLAGS = -e

SHELL = /usr/bin/env bash

PATH := $(PATH):$(PWD)/bash-tools

#RELEASE := v1

.PHONY: default
default:
	@echo "running default build:"
	$(MAKE) test wc

#.PHONY: build
#build: init
#    @echo "running build:"
#
#.PHONY: init
#init:
#    @echo "running init:"
#    if type -P git; then git submodule update --init --recursive; fi
#    @echo

.PHONY: bash-tools
bash-tools:
	@if ! command -v check_pytools.sh; then \
		curl -L https://git.io/bash-bootstrap | sh; \
	fi

.PHONY: test
test: bash-tools
	@echo "running tests:"
	@#check_pytools.sh
	check_yaml.sh

.PHONY: tests
tests: test
	@:

.PHONY: wc
wc:
	git ls-files main.yaml action.yaml '.github/workflows/*.y*ml' | xargs wc

#.PHONY: clean
#clean:
#    find . -name '*.class' -exec rm {} \;

#release:
#    @echo "Releasing $(RELEASE)"
#    git tag --force $(RELEASE)
#    git push --tags --force

sync:
	. .envrc; github_repo_fork_sync.sh
