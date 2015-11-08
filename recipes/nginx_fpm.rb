#
# Cookbook Name:: webap01
# Recipe:: default
#
# Copyright 2015, Maho Takara
#

%w{
  nmon
  nginx
  php5-fpm
  php5-memcached
  php5-mysqlnd-ms
  mysql-client-5.6
}.each do |pkgname|
  package "#{pkgname}" do
    action :install
  end
end

service "nginx" do
  action [ :enable, :start]
end

service "php5-fpm" do
  action [ :enable, :start]
end


execute 'nginx_sites-enabled_default_prep' do
  command 'rm -f /etc/nginx/sites-enabled/default'
  ignore_failure true
end

template "nginx_sites-enabled_default" do
  path "/etc/nginx/sites-enabled/default"
  source "nginx_conf_default.erb"
  owner "root"
  group "root"
  mode 0644
  notifies :restart, "service[nginx]"
end

template "php_test_page" do
  path "/usr/share/nginx/html/info.php"
  source "info.php.erb"
  owner "root"
  group "root"
  mode 0644
end


# config mysql 
mysql_hostname      = node["mysql"]["hostname"]
mysql_user_name     = node["mysql"]["user"]["name"]
mysql_user_password = node["mysql"]["user"]["password"]

template "php5_ini" do
  path "/etc/php5/fpm/php.ini"
  source "php.ini.erb"
  owner "root"
  group "root"
  mode 0644

  variables({
    :hostname => mysql_hostname,
    :username => mysql_user_name,
    :password => mysql_user_password,
  })
  notifies :restart, "service[php5-fpm]"
end



