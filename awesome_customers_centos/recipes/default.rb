#
# Cookbook:: awesome_customers_centos
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

include_recipe 'selinux::permissive'
include_recipe 'awesome_customers_centos::firewall'
include_recipe 'awesome_customers_centos::web_user'
include_recipe 'awesome_customers_centos::web'
include_recipe 'awesome_customers_centos::database'


