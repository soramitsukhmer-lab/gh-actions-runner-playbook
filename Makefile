main:
	@ansible-galaxy collection install -r requirements.yml

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
		plays/install.yml

runner:
	@ansible-playbook \
		-i inventory.ini \
		-u github \
		-K \
		plays/runner.yml

reboot:
	@ansible-playbook \
		-i inventory.ini \
		-u github \
		-K \
		power/reboot.yml
