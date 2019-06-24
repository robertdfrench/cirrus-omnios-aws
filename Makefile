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

.PHONY: image
image:
	$(MAKE) -C image ami.json
	cp image/ami.json ami.auto.tfvars.json
