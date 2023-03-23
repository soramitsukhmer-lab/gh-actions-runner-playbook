<p align="center">
  <img src="docs/res/github-graph.png">
</p>

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

Then add the IP Address of your runner instances under `[runners]` property.

e.g.:
```ini
[runners]
169.89.33.159
166.190.81.215
169.84.197.134
```

## Bootstrap the server

Before you can proceed, you will need to bootstrap the server by running the following command:

```sh
make bootstrap
```

This will ensure all dependencies and packages are installed and configured properly.

**Packages**:

- docker
- docker-compose
- docker-compose-plugin
- docker-buildx-plugin

**Cron**:

- Run `docker system prune` on a weekly basis

> **Note**: You can run this playbook anytime you want to update the packages or cron jobs.

## Operation Guide

There are 3 types of playbook available.

- `runner-create`: Automate Configuring Self-Hosted Runners
- `runner-remove`: Remove Self-Hosted Runners

To run a playbook, simply run `make [playbook-name]`.

e.g.:
```sh
make runner-create
```

> **Warning**: You can only run the playbook once for each type.
