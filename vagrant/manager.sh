#!/bin/bash

if [ -e /vagrant/vault-pass.txt ]; then
    echo "Expected the file '/vagrant/vault-pass.txt' to exist, it does not."
    exit -1
fi

echo "deb http://ftp.debian.org/debian jessie-backports main" | sudo tee -a /etc/apt/sources.list
echo "deb-src http://ftp.debian.org/debian jessie-backports main" | sudo tee -a /etc/apt/sources.list

sudo apt-get update
sudo apt-get -y upgrade

sudo apt-get -y --force-yes install libssl-dev libffi-dev python-dev curl rsync sshpass vim zsh python

# cat /vagrant/id_rsa.pub >> /home/vagrant/.ssh/authorized_keys
# cat /vagrant/hosts >> /etc/hosts

apt-get install -y python-pip libssl-dev build-essential libffi-dev libpython-dev httpie
apt-get install python-apt

wget -c https://bootstrap.pypa.io/get-pip.py
sudo python get-pip.py
rm get-pip.py

sudo pip install --upgrade pip setuptools
sudo pip install -r /vagrant/requirements.txt

cp -f /vagrant/roles/ssh/files/id_rsa /home/vagrant/.ssh/
cp -f /vagrant/roles/ssh/files/id_rsa.pub /home/vagrant/.ssh/
cp -f /vagrant/roles/ssh/files/ssh-config /home/vagrant/.ssh/config
cp -f /vagrant/roles/ssh/files/known_hosts /home/vagrant/.ssh/known_hosts

ansible-vault decrypt --vault-password-file=/vagrant/vault-pass.txt /home/vagrant/.ssh/id_rsa

chown vagrant:vagrant ~/.ssh/id_rsa ~/.ssh/id_rsa.pub ~/.ssh/config ~/.ssh/known_hosts
chmod 700 ~/.ssh
chmod 644 ~/.ssh/id_rsa.pub
chmod 600 ~/.ssh/config ~/.ssh/id_rsa ~/.ssh/known_hosts

echo "alias 'll=ls -la'" >> ~/.bashrc
echo "export ANSIBLE_VAULT_PASSWORD_FILE=/vagrant/vault-pass.txt" >> ~/.bashrc

true
