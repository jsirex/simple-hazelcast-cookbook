# frozen_string_literal: true
require 'spec_helper'

describe 'simple-hazelcast::install' do
  cached(:chef_run) do
    ChefSpec::SoloRunner.new(platform: 'debian', version: '8.6') do |node|
      node.override['hazelcast']['download_url'] = 'http://mymirror/hz.jar'
      node.override['hazelcast']['user'] = 'user'
      node.override['hazelcast']['group'] = 'service'
      node.override['hazelcast']['home'] = '/home/user'
      node.override['hazelcast']['class_path']['custom_jar'] = 'custom.jar'
    end.converge(described_recipe)
  end

  it 'creates directory for hazelcast' do
    expect(chef_run).to create_directory('/home/user').with(recursive: true)
  end

  it 'downloads hazelcast jar from remote' do
    expect(chef_run).to create_remote_file('/home/user/hz.jar')
  end

  it 'merges class_path with custom settings' do
    cp = chef_run.node['hazelcast']['class_path']
    expect(cp).to include('custom_jar' => 'custom.jar', 'hazelcast-jar' => '/home/user/hz.jar')
  end
end
