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
plays/bootstrap:
	@ansible-playbook $(ansible_flags) -u ${user} $@.yml

plays/runner-create:
	@ansible-playbook $(ansible_flags) -u ${user} $@.yml

plays/runner-delete:
	@ansible-playbook $(ansible_flags) -u ${user} $@.yml

# Utils
utils/ping:
	@ansible-playbook $(ansible_flags) -u ${user} $@.yml

utils/reboot:
	@ansible-playbook $(ansible_flags) -u ${user} $@.yml

# Hacks
hacks/github-ssh-keys:
	@ansible-playbook $(ansible_flags) -u ${user} $@.yml

hacks/gradle-cache-clean.yml:
	@ansible-playbook $(ansible_flags) -u ${user} $@.yml
