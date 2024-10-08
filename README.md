# Backups

Automate Linux machine set up using Ansible playbooks

## Requirements

> Requires Poetry

```shell
# install requirements
poetry install
```

## Backup

```shell
poetry run ansible-playbook ./playbooks/backup/<component>.yaml
```

> IMPORTANT
> Commit and push changes to Github after each backup
> to ensure they are available for other Linux machines

## Restore

```shell
poetry run ansible-playbook ./playbooks/restore/<component>.yaml
```

## Install

```shell
poetry run ansible-playbook ./playbooks/install/<component>.yaml
```
