log_level               :info
chef_server_url         'http://192.168.1.11:443'
current_dir = File.dirname(__FILE__)
node_name               "provisioner"
client_key              "#{current_dir}/dummy.pem"
validation_client_name  "validator"
chef_repo_path          "/home/andyw/chef/sainsburys/devops-test"
cookbook_path           [ "#{current_dir}/../cookbooks" ]

