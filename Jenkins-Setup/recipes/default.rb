#
# Cookbook:: Jenkins-Setup
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.
#

 # Download the jenkins war file


 src_filename = "prod-jenkins-module-v#{node['jenkins']['prod']['version']}.war"


 
 src_filepath = File.join(Chef::Config[:file_cache_path],src_filename)
 

 #  src_filepath = "#{Chef::Config['file_cache_path']}/#{src_filename}"

 # extract_path ="#{Chef::Config['file_cache_path']}/tools/jenkins"

 remote_file src_filepath do 
    source node['jenkins']['prod']['url']
    owner 'root'
    group 'root'
    mode '0755'
 end
 
 bash 'Copy_jenkins_war' do 
     cwd ::File.dirname(src_filepath)
     code <<-EOF
     # chown tomcat:tomcat -R /var/chef/cache/#{src_filename}
    # sudo systemctl stop tomcat
     cp #{src_filepath} /usr/share/tomcat/webapps/jenkins.war  
    # sudo systemctl start tomcat
     EOF
     not_if { ::File.exist?('/usr/share/tomcat/webapps/jenkins') }
 end

 git "#{node['jenkins']['prod']['folder']}" do
    remote node['jenkins']['prod']['gitbucket']
    revision 'master'
    user 'root'
    group 'root'
    action :sync
 end
