#!/bin/bash

sudo apt-get update
sudo apt-get -y upgrade

sudo apt-get -y --force-yes install ssh libssl-dev libffi-dev python-dev curl rsync sshpass python

cp -f /vagrant/ansible/roles/ssh/files/id_rsa.pub ~/.ssh/
cp -f /vagrant/ansible/roles/ssh/files/id_rsa.pub ~/.ssh/authorized_keys
cp -f /vagrant/ansible/roles/ssh/files/known_hosts ~/.ssh/known_hosts

chown vagrant:vagrant ~/.ssh/id_rsa ~/.ssh/id_rsa.pub ~/.ssh/config ~/.ssh/known_hosts
chmod 700 ~/.ssh
chmod 644 ~/.ssh/id_rsa.pub
chmod 600 ~/.ssh/config ~/.ssh/id_rsa ~/.ssh/known_hosts

echo "alias 'll=ls -la'" >> ~/.bashrc

true
