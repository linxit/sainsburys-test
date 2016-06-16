#
# Cookbook Name:: sainsburys
# Recipe:: default
#
# Copyright 2016, Andy Wallace
#
# All rights reserved - Do Not Redistribute
#

cookbook_file '/usr/local/src/sainsburys.go' do
  source 'sainsburys.go'
end

bash "Build go app" do
  user 'root'
  code <<-EOF
    cd /usr/local/src
    /usr/local/go/bin/go build sainsburys.go
    mv /usr/local/src/sainsburys /usr/local/bin/sainsburys
  EOF
  not_if { ::File.exists?( "/usr/local/bin/sainsburys" )}
end

execute "Run go app" do
  command "/usr/local/bin/sainsburys &"
end


