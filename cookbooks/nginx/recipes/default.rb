#
# Cookbook Name:: nginx
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
package 'epel-release'
package 'nginx'

app_nodes = search(:node, "role:app")

template "/etc/nginx/conf.d/proxy.conf" do
  source 'proxy.conf.erb'
  variables(
    :app_nodes => app_nodes
  )
  owner 'root'
  group 'root'
  mode  '0644'
end

file '/etc/nginx/conf.d/default.conf' do
  action :delete
end

service 'nginx' do
  action [ :enable, :start ]
  subscribes :restart, "template[/etc/nginx/conf.d/proxy.conf]"
end


