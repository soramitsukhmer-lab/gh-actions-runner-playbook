main:
	@ansible-galaxy collection install -r requirements.yml

install:
	@ansible-playbook \
		-i inventory.ini \
		-u github \
		-K \
		install.yml

runner:
	@ansible-playbook \
		-i inventory.ini \
		-u github \
		-K \
		runner.yml

reboot:
	@ansible-playbook \
		-i inventory.ini \
		-u github \
		-K \
		power/reboot.yml
