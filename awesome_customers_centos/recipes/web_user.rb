#
# Cookbook:: awesome_customers_centos
# Recipe:: web_user
#
# Copyright:: 2017, The Authors, All Rights Reserved.


group node['awesome_customers_centos']['group']


user node['awesome_customers_centos']['user'] do
    group node['awesome_customers_centos'] ['group']
    system true
    shell '/bin/bash'
end
