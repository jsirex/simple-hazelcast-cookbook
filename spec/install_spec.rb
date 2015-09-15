require 'spec_helper'

describe 'simple-hazelcast::install' do
  cached(:chef_run) do
    ChefSpec::ServerRunner.new do |node|
      node.set['hazelcast']['download_url'] = 'http://mymirror/hz.jar'
      node.set['hazelcast']['user'] = 'user'
      node.set['hazelcast']['group'] = 'service'
      node.set['hazelcast']['home'] = '/home/user'
      node.set['hazelcast']['class_path']['custom_jar'] = 'custom.jar'
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
