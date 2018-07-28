# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.define :test, :autostart => true do |node|
    node.vm.box = 'ubuntu/trusty64'
    node.vm.hostname = 'test'
    node.vm.network :private_network, ip: "10.0.11.11", hostsupdater: "skip"
    node.vm.provider "virtualbox" do |vb|
      vb.memory = "1024"
      vb.gui = false
      vb.customize ['modifyvm', :id, '--natdnshostresolver1', 'on']
    end
    node.vm.provision :shell, path: "vagrant/test.sh", privileged: false
  end

end
