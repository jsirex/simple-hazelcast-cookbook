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

describe file('/etc/sv/hazelcast/run') do
  it { should be_file }
  its(:content) { should match 'export CLASSPATH=/opt/hazelcast/hazelcast-all-3.4.2.jar:/tmp' }
end
