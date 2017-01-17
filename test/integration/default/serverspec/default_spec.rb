# frozen_string_literal: true
require_relative 'spec_helper'

# Example for serverspec
describe command('/bin/true') do
  its(:exit_status) { should eq 0 }
end

describe process('java') do
  it { should be_running }
  its(:user) { should eq 'hazelcast' }
  its(:args) { should match(/-DtestOpt=true/) }
end

describe file('/etc/sv/hazelcast/run') do
  it { should be_file }
  its(:content) { should match 'export CLASSPATH=/opt/hazelcast/hazelcast-all-3.4.2.jar:/tmp' }
end

# # Example for infrataster
# describe server(:public) do
#   describe http('http://host/') do
#     it 'responses with redirect to https' do
#       expect(response.headers['Location']).to eq('https://host/')
#     end
#
#     it 'response code is 301' do
#       expect(response.status).to eq(301)
#     end
#   end
#
#   describe http('https://host/', ssl: { verify: false }) do
#     it 'response code is 200' do
#       expect(response.status).to eq(200)
#     end
#   end
# end
