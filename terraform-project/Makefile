# Default target
.PHONY: all
all: plan


init:
	terraform init

plan: init
	terraform plan -var-file="dev.tfvars" -out="tfPlan.tfplan"

apply: init
	terraform apply "tfPlan.tfplan"

destroy: 
	terraform destroy -var-file="dev.tfvars"

validate:
	terraform validate

fmt:
	terraform fmt

lint:
	tflint --chdir=.