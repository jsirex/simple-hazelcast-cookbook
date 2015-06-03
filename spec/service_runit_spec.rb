require 'spec_helper'

describe 'simple-hazelcast::service_runit' do
  cached(:chef_run) do
    ChefSpec::ServerRunner.new do |node|
      node.set['hazelcast']['download_url'] = 'http://mymirror/hz.jar'
    end.converge(described_recipe)
  end

  it 'includes runit' do
    expect(chef_run).to include_recipe('runit')
  end

  it 'enables and starts runit_service for hazelcast' do
    expect(chef_run).to enable_runit_service('hazelcast')
    expect(chef_run).to start_runit_service('hazelcast')
  end
end
