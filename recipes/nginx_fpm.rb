#
# Cookbook Name:: webap01
# Recipe:: default
#
# Copyright 2015, Maho Takara
#

%w{
  nginx
  php-fpm
  php-memcached
  php-mysql
}.each do |pkgname|
  package "#{pkgname}" do
    action :install
  end
end

service "nginx" do
  action [ :enable, :start]
  supports :start => true, :restart => true, :enable => true
end

service "php-fpm" do
  action [ :enable, :start]
  supports :start => true, :restart => true, :enable => true
end

cookbook_file "/etc/nginx/conf.d/wordpress.conf" do
  source "wordpress.conf"
  owner "root"
  group "root"
  mode 0644
  notifies :restart, "service[nginx]"
end

cookbook_file "/usr/share/nginx/html/info.php" do
  source "info.php"
  owner "root"
  group "root"
  mode 0644
end


