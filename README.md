# Backups

Automate Linux machine set up using Ansible playbooks

## Requirements

```shell
sudo apt install ansible-core
```

## Backup

```shell
ansible-playbook ./playbooks/backup/<component>.yaml
```

> IMPORTANT
> Commit and push changes to Github after each backup
> to ensure they are available for other Linux machines

## Restore

```shell
ansible-playbook ./playbooks/restore/<component>.yaml
```

## Install

```shell
ansible-playbook ./playbooks/install/<component>.yaml
```
