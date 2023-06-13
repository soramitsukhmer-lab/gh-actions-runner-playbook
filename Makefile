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

# Functions
define run_playbook
.PHONY: $(1)
$(1):
	@ansible-playbook $(ansible_flags) -u ${user} $$@
endef

# Plays
$(eval $(call run_playbook, plays/bootstrap.yml))
$(eval $(call run_playbook, plays/runner-create.yml))
$(eval $(call run_playbook, plays/runner-remove.yml))

# Utils
$(eval $(call run_playbook, utils/disk-usage.yml))
$(eval $(call run_playbook, utils/cron.yml))
$(eval $(call run_playbook, utils/ping.yml))
$(eval $(call run_playbook, utils/reboot.yml))

# Hacks
$(eval $(call run_playbook, hacks/github-ssh-keys.yml))
$(eval $(call run_playbook, hacks/gradle-purge.yml))
$(eval $(call run_playbook, hacks/npm-purge.yml))
