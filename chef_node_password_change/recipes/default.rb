#
# Cookbook:: chef_node_password_change
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.
#

  data_node = data_bag_item('nodepassword','node-dev')

 # bash 'changepassword' do 
  
 #  #user 'root'
 #  code <<-EOH
     
  #   sudo su root    

   #  echo "#{data_node['password']}" | /bin/passwd --stdin  "#{data_node['user']}"

 #  EOH
 # end

 # Implementing the same using User resource to achive idempotency
 
 
    user 'changepassword' do
 
     username data_node['user']
     password data_node['password']
               
     action :modify
   end


