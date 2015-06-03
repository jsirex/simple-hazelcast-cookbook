require 'serverspec'

set :backend, :exec

describe command('/bin/true') do
  its(:exit_status) { should eq 0 }
end

describe process('java') do
  it { should be_running }
  its(:user) { should eq 'hazelcast' }
  its(:args) { should match /-DtestOpt=true/}
end
