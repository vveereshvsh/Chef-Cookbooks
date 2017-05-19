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
 httpd_module 'php5' do
   instance 'customers'
 end

# Install php-mysql.
#
 package 'php5-mysql' do 
    action :install
    notifies :restart, 'httpd_service[customers]'
 end


# Install wordpress

   bash 'install_wordpress_tarball' do 
      cwd 'var/chef/cache'
      code <<-EOF
      wget https://wordpress.org/wordpress-4.5.tar.gz
      tar xvfz wordpress-4.5.tar.gz -C /var/www/customers/public_html/
      EOF
    not_if { ::File.exist?('/var/www/customers/public_html/wordpress/wp-settings.php')}
  end 



# Configure wordpress wp-config.php

template '/var/www/customers/public_html/wordpress/wp-config.php' do
  source 'wp-config.php.erb'
  owner 'www-data'
  group 'www-data'
  mode '0755'
  notifies :restart, 'httpd_service[customers]'
end

