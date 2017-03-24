#
# Cookbook:: User
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

user 'name' do
    manage_home true 
    comment 'A random user'
    uid '1234'
    gid '1234'
    home '/home/random'
    shell '/bin/bash/'
    password '$1$bacon$XOQvGFgEXHrDRm3H5dRhW/'
    # using this command to generate the encrypted password : openssl passwd -1 -salt bacon "Plaintext"
    username 'tester'  #defaults to 'name' as specified in the resource
    action [:create, :lock]
end

# Create system user
#
 user 'systemguy' do
   comment 'system guy'
   system true  
   shell 'bin/bash'
   action :create
 end
