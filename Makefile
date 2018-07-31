.PHONY: help clean clean-pyc clean-build install deps encrypt-all decrypt-all tag

project-name = ep_config

help:
	@echo "clean - remove all artifacts"
	@echo "clean-build - remove build artifacts"
	@echo "clean-pyc - remove Python file artifacts"
	@echo "release - package and upload a release"
	@echo "install - install"
	@echo "deps - install dependencies"
	@echo "encrypt-all - Ansible encrypt all *vault* files"
	@echo "decrypt-all - Ansible decrypt all *vault* files"
	@echo "tag - create a git tag with current version"

install: deps

deps:
	pip install -r requirements.txt

clean: clean-build clean-pyc

clean-build:
	rm -fr build/
	rm -fr dist/
	rm -fr *.egg-info

clean-pyc:
	find . -name '*.pyc' -exec rm -f {} +
	find . -name '*.pyo' -exec rm -f {} +
	find . -name '*~' -exec rm -f {} +
	find . -name '__pycache__' -exec rm -rf {} +
	find . -name '*.log*' -delete

encrypt-all:
	find . -mindepth 2 -name '*vault*' -exec echo "Encrypting: {}" \; -exec ansible-vault encrypt {} \;

decrypt-all:
	find . -mindepth 2 -name '*vault*' -exec echo "Decrypting: {}" \; -exec ansible-vault decrypt {} \;

tag: clean
	@echo "Creating git tag v$(tag)"
	git tag v$(tag)
	git push --tags

runvm:
	vagrant up vepcon
