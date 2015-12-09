#
#
# Cookbook Name:: sdinc-rundeck
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

package 'aptitude'

include_recipe 'rundeck::server'
# TODO: need to figure where create_chef_dir comes from
# include_recipe 'create_chef_dir'
include_recipe 'rundeck::chef-rundeck'
