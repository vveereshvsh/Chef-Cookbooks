#
# Cookbook:: Tomcat7
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.
#
#
   
   # Install Tomcat 7 using yum

   package 'tomcat'

   # Restart the service based on the notification

   service 'tomcat' do
      action [:nothing,:enable]
   end  

   # Configure the tomcat.conf file from the template
   
   template 'usr/share/tomcat/conf/tomcat.conf' do 
      source 'tomcat.conf.erb'
      owner 'tomcat'
      group 'tomcat'
      mode '0644'   
      notifies :restart, 'service[tomcat]', :immediately
   end

  template 'usr/share/tomcat/conf/tomcat-users.xml' do  
     source 'tomcat-users.xml.erb'
     owner 'tomcat'
     group 'tomcat'
     mode '0644'   
     notifies :restart, 'service[tomcat]' ,:immediately
  end
