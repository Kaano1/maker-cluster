TERRAFORM = terraform

PREPARE = $(TERRAFORM) init
APPLY = $(TERRAFORM) apply
UPDATE = $(PREPARE) -upgrade
DESTROY = $(TERRAFORM) destroy

all: ask terraform ansible

update:
	$(UPDATE) && $(APPLY) -auto-approve

stop:
	$(DESTROY) -auto-approve

ask:
	@clear && \
	echo "How many worker node would you like to create?"

terraform:
	$(PREPARE) && $(APPLY) -auto-approve -var="worker_count=$(shell read worker_count && echo $$worker_count)" && terraform output -raw instance_ids > ansible/inventory.ini

output:
	terraform output -raw instance_ids > ansible/inventory.ini

ansible:
	cd ansible/ && ansible-playbook -i inventory.ini main.yml --private-key /home/kaan/myComputer.pem  --ssh-extra-args="-o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null"

re: stop start

.PHONY: all start stop output update update-apply re ansible