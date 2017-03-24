#
# Cookbook Name:: TomCat-Server
# Recipe:: default
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#


##### Install the prerequisites for Tomcat server####


#package 'update'
package 'java-1.8.0-openjdk'


#env 'JAVA_HOME','JAVA_JRE' do
#value "/usr/lib/jvm/jre-1.8.0-openjdk"
#value "/usr/lib/jvm/jre-1.8.0-openjdk-1.8.0.121-0.b13.el7_3.x86_64"
#action:create
#end 
#execute 'export JAVA_HOME="/usr/lib/jvm/jre-1.8.0-openjdk"'

#execute 'export JAVA_JRE="/usr/lib/jvm/jre-1.8.0-openjdk-1.8.0.121-0.b13.el7_3.x86_64"'


########## Create a Tomcat User#######

user 'tomcat' do
home '/home/tomcat'
password '9081D55174CDED3B08B481E1277A003CC6C2CB1088BBF103F19D63A23909B7C3'
action:create
end

####### Create a tomcat group ########


group 'tomcat' do 
action:create
end

#Create a directory for tomcat

directory '/opt/tomcat' do
   mode 0755
   owner 'tomcat'
   group 'tomcat'
   recursive true
end


#execute 'sudo useradd -M -s /bin/nologin -g tomcat -d /opt/tomcat tomcat'

remote_file '/opt/tomcat/apache-tomcat.tar.gz' do
 	source 'http://apache.mirrors.ionfish.org/tomcat/tomcat-8/v8.0.42/bin/apache-tomcat-8.0.42.tar.gz'
 	owner 'tomcat'
 	group 'tomcat'
	action:create
end

#execute 'tar xvfz apache-tomcat-8*tar.gz -C /opt/tomcat --strip-components=1'


bash 'install_tomcat' do 
      cwd '/opt/tomcat/'
      group 'tomcat'
      code <<-EOH
	tar xfz apache-tomcat.tar.gz -C /opt/tomcat --strip-components=1
        cd /opt        
	chown -R tomcat:tomcat tomcat
	EOH
      not_if {::File.exist?('/opt/tomcat') }
     
end

execute 'Daemon-reload' do
    command 'systemctl daemon-reload'
    action :nothing
end

file '/etc/systemd/system/tomcat.service' do
  content '# Systemd unit file for tomcat 
[Unit]
Description=Apache Tomcat Web Application Container
After=syslog.target network.target

[Service]
Type=forking

Environment=JAVA_HOME=/usr/lib/jvm/jre
Environment=CATALINA_PID=/opt/tomcat/temp/tomcat.pid
Environment=CATALINA_HOME=/opt/tomcat
Environment=CATALINA_BASE=/opt/tomcat
Environment=\'CATALINA_OPTS=-Xms512M -Xmx1024M -server -XX:+UseParallelGC\'
Environment=\'JAVA_OPTS=-Djava.awt.headless=true -Djava.security.egd=file:/dev/./urandom\'

ExecStart=/opt/tomcat/bin/startup.sh
ExecStop=/bin/kill -15 $MAINPID

User=tomcat
Group=tomcat
UMask=0007
RestartSec=10
Restart=always

[Install]
WantedBy=multi-user.target'

notifies :run, 'execute[Daemon-reload]', :immediately
end   

#bash 'Run_tomcat_StartUp' do 
 #     cwd '/opt/tomcat/bin'
  #    code <<-EOH
   #   systemctl daemon-reload
    #  EOH
   # only_if { ($? != 0) }
#end


service 'tomcat' do
      action [:enable, :start]
end














