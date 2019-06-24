plugins=.terraform/plugins/init

check: fmt plan
	@echo "If you like what you see, run 'make install'"

install: $(plugins) image
	terraform apply -auto-approve

fmt:
	terraform fmt -check -diff

plan: $(plugins) image
	terraform plan

$(plugins): providers.tf
	terraform init
	@touch $@

image: validate
	packer build packer.json

validate: 
	packer validate packer.json
