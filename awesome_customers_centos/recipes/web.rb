#
# Cookbook:: awesome_customers_centos
# Recipe:: web
#
# Copyright:: 2017, The Authors, All Rights Reserved.
#


# Install Apche and start the service

httpd_service 'customers' do
   mpm 'prefork'
   action [:create, :start]
end  

# Add the site configuration.
httpd_config 'customers' do 
   instance 'customers'
   source 'customers.conf.erb'
   notifies :restart, 'httpd_service[customers]'
end

# create the document root directory.

directory node['awesome_customers_centos']['document_root'] do
   recursive true
end

#write the home page .
template "#{node['awesome_customers_centos']['document_root']}/index.php"  do
   source 'index.php.erb'
   content '<html>This  is a placeholder</html>'
   mode '0644'
   owner node['awesome_customers_centos']['user']
   group node['awesome_customers_centos']['group']
end

#Install the mod_php Apache module
#
 httpd_module 'php' do
   instance 'customers'
 end

# Install php-mysql.
#
 package 'php-mysql' do 
    action :install
    notifies :restart, 'httpd_service[customers]'
 end

# Configure wordpress wp-config.php

template '/var/www/customers/public_html/wordpress/wp-config.php' do
  source 'wp-config.php.erb'
  owner 'apache'
  group 'apache'
  mode '0755'
  notifies :restart, 'httpd_service[customers]'
end

