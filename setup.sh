#!/bin/sh

curl https://raw.githubusercontent.com/eslam-gomaa/mysql_secure_installation_Ansible/master/library/mysql_secure_installation.py > $0/library/mysql_secure_installation.py

dnf install -y epel-release

dnf install -y ansible

ansible-galaxy collection install community.mysql community.general ansible.posix

ansible-playbook playbook.yaml