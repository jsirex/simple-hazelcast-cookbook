include_recipe 'runit'
include_recipe 'simple-hazelcast::_jar'

runit_service 'hazelcast' do
  default_logger true
  options(
    'user' => node['hazelcast']['user'],
    'home' => node['hazelcast']['home'],
    'java_home' => node['hazelcast']['java_home'],
    'java_opts' => node['hazelcast']['java_opts'],
    'jar' => node['hazelcast']['jar']
  )
  subscribes :restart, "remote_file[#{node['hazelcast']['jar']}]"

  action [:enable, :start]
end
