name 'awesome_customers_centos_latest'
maintainer 'The Authors'
maintainer_email 'you@example.com'
license 'all_rights'
description 'Installs/Configures awesome_customers_centos_latest'
long_description 'Installs/Configures awesome_customers_centos_latest'
version '0.0.6'

depends 'apt'    , '~> 4.0.2'
depends 'selinux' , '~> 0.9'
depends 'firewall' , '~> 2.5.4'
depends 'httpd'    , '~> 0.4.3'
depends 'mysql'    , '~> 7.0'
depends 'mysql2_chef_gem' , '~> 1.1'
depends 'database' , '~> 6.0'
# The `issues_url` points to the location where issues for this cookbook are
# tracked.  A `View Issues` link will be displayed on this cookbook's page when
# uploaded to a Supermarket.
#
# issues_url 'https://github.com/<insert_org_here>/awesome_customers_centos/issues' if respond_to?(:issues_url)

# The `source_url` points to the development reposiory for this cookbook.  A
# `View Source` link will be displayed on this cookbook's page when uploaded to
# a Supermarket.
#
# source_url 'https://github.com/<insert_org_here>/awesome_customers_centos' if respond_to?(:source_url)
