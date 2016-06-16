#
# Cookbook Name:: provision
# Recipe:: default
#
# Copyright 2015, Andy Wallace
#
# All rights reserved - Do Not Redistribute
#
require 'chef/provisioning/vagrant_driver'
with_driver 'vagrant'

vagrant_box 'centos6' do
    url 'https://opscode-vm-bento.s3.amazonaws.com/vagrant/virtualbox/opscode_centos-6.6_chef-provisionerless.box'
end

with_chef_server "http://localhost:8889"

with_machine_options :vagrant_options => {
    'vm.box' => 'centos6'
}, :convergence_options => { 'chef_version' => '12.8.1' }

include_recipe 'provision::servers'

