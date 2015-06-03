require 'spec_helper'

describe 'simple-hazelcast::install' do
  cached(:chef_run) do
    ChefSpec::ServerRunner.new do |node|
      node.set['hazelcast']['download_url'] = 'http://mymirror/hz.jar'
      node.set['hazelcast']['user'] = 'user'
      node.set['hazelcast']['group'] = 'service'
      node.set['hazelcast']['home'] = '/home/user'
    end.converge(described_recipe)
  end

  it 'creates user' do
    expect(chef_run).to create_user('user').with(home: '/home/user')
  end

  it 'creates group' do
    expect(chef_run).to create_group('service')
  end

  it 'creates directory for hazelcast' do
    expect(chef_run).to create_directory('/home/user').with(recursive: true)
  end

  it 'downloads hazelcast jar from remote' do
    expect(chef_run).to create_remote_file('/home/user/hz.jar')
  end
end
