#
# Cookbook Name:: PanCake
# Recipe:: default
#
# Copyright 2017,  LYNC school
#
# All rights reserved - Do Not Redistribute
#
#     resource 'item' do
#          command instructions
#     end

file 'tmp/dummy.txt' do 

   content 'This file is created by chef.....'
   mode 0644
   owner 'root'
   group 'root'

end


