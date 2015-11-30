#
#
# Cookbook Name:: sdinc-rundeck
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

package 'aptitude'

include_recipe 'rundeck::server'
include_recipe 'create_chef_dir'
include_recipe 'rundeck::chef-rundeck'
