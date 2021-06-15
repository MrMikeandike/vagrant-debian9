.DEFAULT_GOAL := help
.PHONY: help test build
MAKEFILE_DIR := $(abspath $(dir $(lastword $(MAKEFILE_LIST))))
#-------CUSTOMIZABLE-------#
LOCAL_BOX_NAME := maidebian9
# need url format for adding local box
# see issue here: https://github.com/hashicorp/vagrant/issues/12359
PWD_URL_FORMAT := file:///$(MAKEFILE_DIR)
OUTPUT_BOX_URL_FORMAT := $(PWD_URL_FORMAT)/output-debian9/package.box
# 1 = show packer debug log
VALIDATE_DEBUG := 0
BUILD_DEBUG := 1
#-----END CUSTOMIZABLE-----#
help: ## Displays this help message
	@grep -E '^[a-zA-Z0-9_-]+?:[ a-zA-Z0-9_-]*?##.*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## *"}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
validate: ## validate packer file
	@packer validate debian9box.pkr.hcl
debug_vars: ## Shows variables defined and used in this Makefile for debugging purposes
	@echo "MAKEFILE_DIR: ${MAKEFILE_DIR}"
	@echo "LOCAL_BOX_NAME: ${LOCAL_BOX_NAME}"
	@echo "PWD_URL_FORMAT: ${PWD_URL_FORMAT}"
	@echo "OUTPUT_BOX_URL_FORMAT: ${OUTPUT_BOX_URL_FORMAT}"
build: ## runs packer build with options useful for debugging
	@PACKER_LOG=1 packer build --on-error=ask --force debian9box.pkr.hcl

add: ## adds output of build to maidebian9 local vagrant box
	@vagrant box add --name ${LOCAL_BOX_NAME} ${OUTPUT_BOX_URL_FORMAT}
