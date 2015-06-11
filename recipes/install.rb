include_recipe 'simple-hazelcast::_jar'

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
