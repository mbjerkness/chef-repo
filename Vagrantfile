# -*- mode: ruby -*-
# vi: set ft=ruby :


Vagrant.configure("2") do |config|

  config.vm.box = "opscode-ubuntu-12.04"
  config.vm.box_url = "http://opscode-vm-bento.s3.amazonaws.com/vagrant/opscode_ubuntu-12.04_provisionerless.box"
  config.omnibus.chef_version = :latest

    config.vm.provision :chef_client do |chef|
      chef.provisioning_path = "/etc/chef"
      chef.chef_server.url = "https://chef.bjerkness.net"
      
      # chef.validation_key_path = "/.chef/<org>-validator.pem"
      # chef.validation_client_name = "<org>-validator"

      chef.node_name = "server"


  end
end