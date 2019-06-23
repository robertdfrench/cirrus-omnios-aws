plugins=.terraform/plugins/init

deploy: $(plugins)
	terraform apply -auto-approve

plan: $(plugins)
	terraform plan

$(plugins): providers.tf
	terraform init
	@touch $@
