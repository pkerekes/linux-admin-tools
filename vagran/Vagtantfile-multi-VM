# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/xenial64"
  config.vm.provision "shell", path: "vm-init.sh"
config.vm.define "userver0" do |userver0|
     userver0.vm.hostname = "userver0"
     userver0.vm.network "private_network", ip: "172.3.14.10"
     userver0.vm.network :forwarded_port, guest: 22, host: 22000, id: 'ssh'
     userver0.vm.provider "virtualbox" do |vb|
       vb.gui = false
       vb.cpus = "1"
       vb.memory = "256"
       vb.customize ["modifyvm", :id, "--cpuexecutioncap", "65"]
       vb.name = "userver0"
     end
end
config.vm.define "userver1" do |userver1|
     userver1.vm.hostname = "userver1"
     userver1.vm.network "private_network", ip: "172.3.14.11"
     userver1.vm.network :forwarded_port, guest: 22, host: 22001, id: 'ssh'
     userver1.vm.provider "virtualbox" do |vb|
       vb.gui = false
       vb.cpus = "1"
       vb.memory = "256"
       vb.customize ["modifyvm", :id, "--cpuexecutioncap", "65"]
       vb.name = "userver1"
     end
end
config.vm.define "userver2" do |userver2|
     userver2.vm.hostname = "userver2"
     userver2.vm.network "private_network", ip: "172.3.14.12"
     userver2.vm.network :forwarded_port, guest: 22, host: 22002, id: 'ssh'
     userver2.vm.provider "virtualbox" do |vb|
       vb.gui = false
       vb.cpus = "1"
       vb.memory = "256"
       vb.customize ["modifyvm", :id, "--cpuexecutioncap", "65"]
       vb.name = "userver2"
     end
end
end
