require 'chefspec'
require 'chefspec/berkshelf'
require_relative 'rackspace_cloud_monitoring_service_shared'

::LOG_LEVEL = :fatal

def stub_resources
  allow(File).to receive(:size?).with('/etc/rackspace-monitoring-agent.cfg').and_return(nil)
end

def node_resources(node)
  node.set['rackspace_cloud_monitoring']['cloud_credentials_username'] = 'dummyusername'
  node.set['rackspace_cloud_monitoring']['cloud_credentials_api_key'] = 'dummyapikey'
end

at_exit { ChefSpec::Coverage.report! }
