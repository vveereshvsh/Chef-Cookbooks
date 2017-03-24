def random_password
    require 'securerandom'
    SecureRandom.base64
end

default['firewall']['allow_ssh'] = true
default['firewall']['firewalld']['permanent'] = true 
default['awesome_customers_centos']['open_ports'] = 80

default['awesome_customers_centos']['user'] = 'web_admin'
default['awesome_customers_centos']['group'] = 'web_admin'

default['awesome_customers_centos']['document_root'] = '/var/www/customers/public_html'

normal_unless['awesome_customers_centos']['database']['root_password'] = random_password
normal_unless['awesome_customers_centos']['database']['admin_password'] = random_password

default['awesome_customers_centos']['database']['dbname'] = 'my_company'
default['awesome_customers_centos']['database']['host'] = '127.0.0.1'
default['awesome_customers_centos']['root_username'] = 'root'
default['awesome_customers_centos']['root_password'] = 'mysql_root_password'


default['awesome_customers_centos']['database']['admin_username'] = 'db_admin'
default['awesome_customers_centos']['database']['admin_password'] = 'mysql_admin_password'
