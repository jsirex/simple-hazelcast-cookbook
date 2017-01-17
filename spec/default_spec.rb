# frozen_string_literal: true
require 'spec_helper'

describe 'simple-hazelcast::default' do
  cached(:chef_run) do
    ChefSpec::SoloRunner.new(platform: 'debian', version: '8.6').converge(described_recipe)
  end

  it 'should not fail' do
    expect(chef_run)
  end
end
