## About
Soramitsu Khmer's GitHub Actions Runner Playbook 

## Getting started

### Initialize Workspace

> You only need to initialize the workspace once,
> But you will need to run `source env/bin/activate` to activate the workspace.

This uses Python `venv` to help setup a local workspace.

```sh
# Initialize venv
python3 -m venv env
# Activate venv
source env/bin/activate
```

### Install Role and Collection

```sh
make install
```

### Update `inventory.ini`

If there is no `inventory.ini` file within the root project directory, you can manually copy the `inventory.ini.example` and save it as `inventory.ini` or run `make inventory.ini`.

Edit `inventory.ini` and update the following variables:

- `github_pat`: your personal access token
- `github_organization`: the organization which the runner will be deployed to

Then add the IP Address of your runner instances under `[actions-runner]` property.

e.g.:
```ini
[actions-runner]
169.89.33.159
166.190.81.215
169.84.197.134
```

## Operation Guide

There are 3 types of playbook available.

- `runner-create`: Automate Configuring Self-Hosted Runners
- `runner-remove`: Removing Self-Hosted Runners (Uninstall service only!)
- `runner-delete`: Delete Self-Hosted Runners (Destroy and remove everything!)

To run a playbook, simply run `make [playbook-name]`.

e.g.:
```sh
make runner-create
```
