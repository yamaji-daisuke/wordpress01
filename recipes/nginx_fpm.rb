# -*- coding: utf-8 -*-
#
# Cookbook Name:: wordpress01
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
  mysql-server-5.5
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



