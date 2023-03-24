env := default
user := root

debug := false
verbose := false
ansible_flags := 

ifeq ($(verbose),true)
	ansible_flags := -vv
endif

ifeq ($(debug),true)
	ansible_flags := -vvv
endif

.PHONY: it
it: install inventory.ini

install: inventory.ini
	@mkdir -p logs
	@ansible-galaxy install -r requirements.yml --force

inventory.ini:
	@test -f "$@" || cp "inventory.ini.example" "$@"

# Plays
bootstrap:
	@ansible-playbook $(ansible_flags) -u ${user} plays/$@.yml

runner-create:
	@ansible-playbook $(ansible_flags) -u ${user} plays/$@.yml

runner-delete:
	@ansible-playbook $(ansible_flags) -u ${user} plays/$@.yml

# Utils
ping:
	@ansible-playbook $(ansible_flags) -u ${user} utils/$@.yml

reboot:
	@ansible-playbook $(ansible_flags) -u ${user} utils/$@.yml
