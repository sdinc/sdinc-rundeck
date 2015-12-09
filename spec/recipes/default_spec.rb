#
# Cookbook Name:: sdinc-rundeck
# Spec:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

require 'spec_helper'
require 'chef-vault'

describe 'sdinc-rundeck::default' do
  context 'on default' do
    let(:chef_run) do
      ChefSpec::ServerRunner.new do |node, server|
        node.set['sdinc-rundeck']['install_aptitude'] = 'yes'
        # node.set['rundeck']['secret_file'] = 'test/integration/server/encrypted_data_bag_secret'
        node.set['rundeck']['rundeck_databag'] = 'rundeck'
        node.set['rundeck']['rundeck_databag_secure'] = 'secure'
        node.set['rundeck']['rundeck_databag_users'] = 'users'
        node.set['rundeck']['rundeck_projects_databag'] = 'project'
        server.create_data_bag('rundeck', 'secure' => { 'data' => 'abc123' },
                                          'users' => { 'data' => 'def456' })
        server.create_data_bag('project', 'proj1' => { 'data' => 'abc123' },
                                          'proj2' => { 'data' => 'def456' },
                                          'proj3' => { 'data' => 'asdf' })
      end.converge(described_recipe)
    end

    before do
      stub_command('/usr/sbin/apache2 -t').and_return(['', ''])
    end

    it 'converges successfully' do
      chef_run # This should not raise an error
    end

    it 'should install package aptitude' do
      expect(chef_run).to install_package('aptitude')
    end
  end
end
