#
# Cookbook:: awesome_customers_centos_latest
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

include_recipe 'apt::default'
include_recipe 'selinux::permissive'
include_recipe 'awesome_customers_centos_latest::firewall'
include_recipe 'awesome_customers_centos_latest::web_user'
include_recipe 'awesome_customers_centos_latest::web'
include_recipe 'awesome_customers_centos_latest::database'


