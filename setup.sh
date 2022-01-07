#!/bin/sh

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

curl https://raw.githubusercontent.com/eslam-gomaa/mysql_secure_installation_Ansible/master/library/mysql_secure_installation.py > $SCRIPT_DIR/library/mysql_secure_installation.py

yum install -y epel-release

yum install -y ansible

ansible-galaxy collection install community.mysql community.general ansible.posix

ansible-playbook playbook.yaml