require_relative 'spec_helper'

describe 'rackspace_cloud_monitoring_service_test::default on Centos 6.5' do
  before do
    stub_resources
  end

  CENTOS_SERVICE_OPTS = {
    log_level: LOG_LEVEL,
    platform: 'centos',
    version: '6.5',
    step_into: 'rackspace_cloud_monitoring_service'
  }

  cached(:chef_run) do
    ChefSpec::SoloRunner.new(CENTOS_SERVICE_OPTS) do |node|
      node_resources(node)
    end.converge('rackspace_cloud_monitoring_service_test::default')
  end

  #
  # Resource in rackspace_cloud_monitoring_service_test::default
  #
  context 'rackspace_cloud_monitoring_service test recipe' do
    it_behaves_like 'rackspace monitoring agent set up', 'rhel'
    context 'without cloud credential username' do
      cached(:chef_run) do
        ChefSpec::SoloRunner.new(CENTOS_SERVICE_OPTS) do |node|
          node.set['rackspace_cloud_monitoring']['cloud_credentials_api_key'] = 'dummykey'
        end.converge('rackspace_cloud_monitoring_service_test::default')
      end
      it_behaves_like 'raise error about missing parameters'
    end
    context 'without cloud credential api_key' do
      cached(:chef_run) do
        ChefSpec::SoloRunner.new(CENTOS_SERVICE_OPTS) do |node|
          node.set['rackspace_cloud_monitoring']['cloud_credentials_username'] = 'dummyusername'
        end.converge('rackspace_cloud_monitoring_service_test::default')
      end
      it_behaves_like 'raise error about missing parameters'
    end
  end
end
