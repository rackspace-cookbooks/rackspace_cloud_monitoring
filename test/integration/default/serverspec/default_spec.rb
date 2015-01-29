# Encoding: utf-8

require_relative 'spec_helper'

# Service
describe service('rackspace-monitoring-agent') do
  it { should be_enabled }
end

describe file('/etc/rackspace-monitoring-agent.conf.d') do
  it { should be_directory }
end

# Checks
check_files = %w(
  agent.cpu
  agent.custom
  agent.disk
  agent.filesystem
  remote.http
  agent.load
  agent.memory
  agent.network
)
check_files.each do |check|
  # Minimal test as content is tested in Chefspecs
  describe file("/etc/rackspace-monitoring-agent.conf.d/#{check}.yaml") do
    it { should be_file }
  end
end
