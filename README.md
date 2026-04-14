# Backups

Automate Linux machine set up using Ansible playbooks

## Requirements

```shell
sudo apt install ansible-core
```

## Backup System Configs

```shell
ansible-playbook ./playbooks/backup.yaml
```

## Restore System Configs

```shell
ansible-playbook ./playbooks/restore.yaml --ask-vault-pass
```

## Debug Mode

Append `-e debug=true` to show sensitive task output:

```shell
ansible-playbook ./playbooks/backup.yaml -e debug=true
```

## Install Components

```shell
ansible-playbook ./playbooks/install/<component>.yaml
```
