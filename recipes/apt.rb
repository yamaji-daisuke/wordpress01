# -*- coding: utf-8 -*-
#
# Cookbook Name:: wordpress01
# Recipe:: default
#
# Copyright 2015, Maho Takara
#

execute 'apt-get update' do
  command 'apt-get update'
  action :run
  ignore_failure true
end

