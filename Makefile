TERRAFORM = terraform

PREPARE = $(TERRAFORM) init
APPLY = $(TERRAFORM) apply
UPDATE = $(PREPARE) -upgrade
DESTROY = $(TERRAFORM) destroy

all: start

start:
	$(PREPARE) && $(APPLY) -auto-approve && terraform output instance_ids > ansible/inventory.ini

update:
	$(UPDATE) && $(APPLY) -auto-approve

stop:
	$(DESTROY) -auto-approve

ansible:
	cd ansible/ && ansible-playbook -i inventory.ini main.yml --private-key /home/kaan/myComputer.pem

re: stop start

.PHONY: all start stop output update update-apply re ansible