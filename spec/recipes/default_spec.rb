#
# Cookbook Name:: sdinc-rundeck
# Spec:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

require 'spec_helper'

describe 'sdinc-rundeck::default' do
  context 'on default' do
    let(:chef_run) do
      ChefSpec::ServerRunner.new do |node|
        node.set['sdinc-rundeck']['install_aptitude'] = 'yes'
      end.converge(described_recipe)
    end

    it 'converges successfully' do
      chef_run # This should not raise an error
    end

    it 'should install package aptitude' do
      expect(chef_run).to install_package('aptitude')
    end
  end
end
