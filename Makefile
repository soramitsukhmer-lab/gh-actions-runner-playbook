main:
	@echo No operation was performed!

deploy:
	@ansible-playbook \
		-i inventory.ini \
		-u github \
		-K \
		install.yml

reboot:
	@ansible-playbook \
		-i inventory.ini \
		-u github \
		-K \
		power/reboot.yml

install:
	@ansible-galaxy collection install -r requirements.yml
