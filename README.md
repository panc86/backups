# Backups

Automate Linux machine set up using Ansible playbooks

## Requirements

```shell
sudo apt install ansible-core
```

## Backup System Configs

> `-e debug=true`: show logs (debug mode)
> `-e push=false`: do not push (dry run)

```shell
ansible-playbook ./playbooks/backup.yaml
```

## Restore System Configs

```shell
ansible-playbook ./playbooks/restore.yaml --ask-vault-pass
```

## Setup Development Environment

```shell
ansible-playbook ./playbooks/denv.yaml
```
