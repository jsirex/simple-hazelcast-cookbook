# frozen_string_literal: true
require 'spec_helper'

describe 'simple-hazelcast::user' do
  cached(:chef_run) do
    ChefSpec::SoloRunner.new(platform: 'debian', version: '8.6') do |node|
      node.override['hazelcast']['user'] = 'user'
      node.override['hazelcast']['group'] = 'service'
      node.override['hazelcast']['home'] = '/home/user'
    end.converge(described_recipe)
  end

  it 'creates user' do
    expect(chef_run).to create_user('user').with(home: '/home/user')
  end

  it 'creates group' do
    expect(chef_run).to create_group('service')
  end
end
