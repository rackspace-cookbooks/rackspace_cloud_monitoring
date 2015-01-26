# Encoding: utf-8

require_relative 'spec_helper'

describe service('rackspace-monitoring-agent') do
  it { should be_enabled }
end
