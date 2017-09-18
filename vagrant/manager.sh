#!/bin/bash

if [ -e /vagrant/vault-pass.txt ]; then
    echo "Expected the file '/vagrant/vault-pass.txt' to exist, it does not."
    exit -1
fi

sudo apt-get update
sudo apt-get -y upgrade

sudo apt-get -y --force-yes install libssl-dev libffi-dev \
                                    libssl-dev build-essential \
                                    curl rsync httpie\
                                    sshpass vim ssh

sudo apt-get install -y libffi-dev libpython-dev \
                        python python-dev \
                        python-pip  \
                        python-dbus python-distutils-extra \
                        python-apt

sudo pip install --upgrade pip setuptools
sudo pip install -r /vagrant/requirements.txt

cp -f /vagrant/ansible/roles/ssh/files/id_rsa      ~/.ssh/
cp -f /vagrant/ansible/roles/ssh/files/id_rsa.pub  ~/.ssh/
cp -f /vagrant/ansible/roles/ssh/files/ssh-config  ~/.ssh/config
cp -f /vagrant/ansible/roles/ssh/files/known_hosts ~/.ssh/known_hosts

ansible-vault decrypt --vault-password-file=/vagrant/ansible/vault-pass.txt /home/vagrant/.ssh/id_rsa

chown vagrant:vagrant ~/.ssh/id_rsa ~/.ssh/id_rsa.pub ~/.ssh/config ~/.ssh/known_hosts
chmod 700 ~/.ssh
chmod 644 ~/.ssh/id_rsa.pub
chmod 600 ~/.ssh/config ~/.ssh/id_rsa ~/.ssh/known_hosts

echo "alias 'll=ls -la'" >> ~/.bashrc
echo "export ANSIBLE_VAULT_PASSWORD_FILE=/vagrant/ansible/vault-pass.txt" >> ~/.bashrc

true
