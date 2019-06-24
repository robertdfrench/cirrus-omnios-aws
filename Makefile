plugins=.terraform/plugins/init

check: fmt plan
	@echo "If you like what you see, run 'make install'"

install: $(plugins)
	terraform apply -auto-approve

fmt:
	terraform fmt -check -diff

plan: $(plugins)
	terraform plan

$(plugins): providers.tf
	terraform init
	@touch $@
