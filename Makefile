.PHONE := build

build: ## runs packer build with options useful for debugging
	@PACKER_LOG=1 packer build --on-error=ask --force --var-file=variables.json debian9box.json
