require 'spec_helper'

describe 'simple-hazelcast::default' do
  cached(:chef_run) do
    ChefSpec::ServerRunner.new.converge(described_recipe)
  end
end
