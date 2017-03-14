#
# Cookbook Name:: LAMP-setup
# Recipe:: default
#
# Copyright 2017, LYNC school
#
# All rights reserved - Do Not Redistribute
#


package ['httpd','mod_ssl']do 


   action:install
end

service "httpd" do 

 action:restart
 #action:enable
end

package ['php']do

   action:install
end

package ['mysql']do

   action:install
end
service "mariadb" do

 action:restart
end

package ['myphpadmin']
 #action:enable
 #end
 #
 #
#log 'call a notification' do 

 # notifies:install, package['httpd','mod_ssl'], :immediately
#end
