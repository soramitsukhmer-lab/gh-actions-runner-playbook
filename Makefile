.PHONY: main

main:
	@echo "Receipts:"
	@echo " - deps: Install ansible collections/roles"
	@echo " - install: Install prerequisite packages"
	@echo " - install-runner: Install GitHub Runners"
	@echo " - reboot: Reboot runners"
	@echo " - prune: Runner system prune"

deps:
	@ansible-galaxy collection install -r collections/requirements.yml

ping:
	@ansible-playbook \
		-i inventory.ini \
		-u github \
		plays/ping.yml

install:
	@ansible-playbook \
		-i inventory.ini \
		-u github \
		-K \
		install.yml

install-runner:
	@ansible-playbook \
		-i inventory.ini \
		-u github \
		-K \
		runner.yml

prune:
	@ansible-playbook \
		-i inventory.ini \
		-u github \
		-K \
		prune.yml

reboot:
	@ansible-playbook \
		-i inventory.ini \
		-u github \
		-K \
		power/reboot.yml
