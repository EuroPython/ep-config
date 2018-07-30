# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.define :vepcon, :autostart => true do |node|
    node.vm.box = "ubuntu/bionic64"
    node.vm.hostname = 'vepcon'
    node.vm.network :private_network, ip: "10.0.11.10"
    node.vm.synced_folder ".", "/vagrant", type: "virtualbox"
    node.vm.provision "ansible" do |ansible|
      ansible.limit = "vepcon"
      ansible.playbook = "playbook.yml"
    end
  end
end
