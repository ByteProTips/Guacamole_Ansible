#!/bin/sh

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

curl https://raw.githubusercontent.com/eslam-gomaa/mysql_secure_installation_Ansible/master/library/mysql_secure_installation.py > $SCRIPT_DIR/library/mysql_secure_installation.py

if grep -q -i "release 8" /etc/redhat-release
then
	subscription-manager repos --enable codeready-builder-for-rhel-8-$(arch)-rpms
	dnf install https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm
fi

if grep -q -i "release 7" /etc/redhat-release
then
	subscription-manager repos --enable rhel-*-optional-rpms \
	                           --enable rhel-*-extras-rpms \
	                           --enable rhel-ha-for-rhel-*-server-rpms
	yum install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
fi
else
	yum install -y epel-release
	yum install -y ansible
fi

ansible-galaxy collection install community.mysql community.general ansible.posix

ansible-playbook playbook.yaml