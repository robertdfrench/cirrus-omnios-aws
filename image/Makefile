plugins=.terraform/plugins/init

ami.json: packer.json $(plugins)
	packer validate $<
	packer build $<
	terraform fmt -check -diff
	terraform apply -auto-approve
	terraform output -json > $@

$(plugins): providers.tf
	terraform init
	@touch $@
