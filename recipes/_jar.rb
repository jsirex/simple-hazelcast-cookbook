node.default['hazelcast']['jar'] = ::File.join(node['hazelcast']['home'], ::File.basename(node['hazelcast']['download_url']))
