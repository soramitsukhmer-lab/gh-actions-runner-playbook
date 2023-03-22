env := default
user := root
verbose := false
ansible_flags := 

ifeq ($(verbose),true)
	ansible_flags := -vvv
endif

env:
	@python3 -m venv env

inventory.ini:
	@test -f "$@" || cp "inventory.ini.example" "$@"

install: inventory.ini
	@mkdir -p logs
	@ansible-galaxy install -r requirements.yml --force
	
bootstrap:
	@ansible-playbook $(ansible_flags) -u ${user} $@.yml

runner-create:
	@ansible-playbook $(ansible_flags) -u ${user} $@.yml

runner-remove:
	@ansible-playbook $(ansible_flags) -u ${user} $@.yml

runner-delete:
	@ansible-playbook $(ansible_flags) -u ${user} $@.yml
