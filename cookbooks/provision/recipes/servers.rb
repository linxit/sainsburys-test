#
# Cookbook Name:: provision
# Recipe:: servers
#
# Copyright 2016, Andy Wallace
#
# All rights reserved - Do Not Redistribute
#
require 'chef/provisioning'

num_app = 2

1.upto(num_app) do |i|
  machine "app0#{i}" do
    add_machine_options :vagrant_config => <<-EOC
config.vm.network "private_network", ip: "10.0.1.1#{i}"
EOC
    role 'app'
    converge true
  end
end

machine 'proxy01' do
  add_machine_options :vagrant_config => <<-EOC
config.vm.network "forwarded_port", guest:80, host:8888
config.vm.network "private_network", ip: "10.0.1.10"
EOC
  role 'webproxy'
  converge true
end

