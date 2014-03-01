# -*- mode: ruby -*-
# vi: set ft=ruby :


Vagrant.configure("2") do |config|

  config.vm.box = "opscode-ubuntu-12.04-i386"
  config.vm.box_url = "https://opscode-vm.s3.amazonaws.com/vagrant/opscode_ubuntu-12.04-i386_provisionerless.box"
  config.vm.network :forwarded_port, guest: 8080, host: 9090
  config.vm.hostname = "mikebjerkness-starter"
  

  config.omnibus.chef_version = :latest

    config.vm.provision :chef_client do |chef|
      chef.provisioning_path = "/etc/chef"
      #chef.chef_server.url = "https://chef.bjerkness.net"
      chef.chef_server_url = "https://api.opscode.com/organizations/bjerknet"
      chef.validation_client_name = "bjerknet-validator"
      chef.validation_key_path = ".chef/bjerknet-validator.pem"

      chef.node_name = "server"
  end
end