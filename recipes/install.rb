include_recipe 'simple-hazelcast::_jar'

user 'hazelcast user' do
  username node['hazelcast']['user']
  comment 'Hazelcast User'
  home node['hazelcast']['home']
  shell '/bin/bash'
  supports manage_home: false
  action :create
  system true
end

group 'hazelcast group' do
  group_name node['hazelcast']['group']
  action :create
  system true
end

directory node['hazelcast']['home'] do
  owner node['hazelcast']['user']
  group node['hazelcast']['group']

  recursive true
end

remote_file node['hazelcast']['jar'] do
  source node['hazelcast']['download_url']

  owner node['hazelcast']['user']
  group node['hazelcast']['group']
  checksum node['hazelcast']['checksum']
end
