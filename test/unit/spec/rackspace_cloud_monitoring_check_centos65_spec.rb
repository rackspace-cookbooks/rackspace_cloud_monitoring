require_relative 'spec_helper'

describe 'rackspace_cloud_monitoring_check_test::* on Centos 6.5' do
  before do
    stub_resources
  end

  CENTOS_OPTS = {
    log_level: LOG_LEVEL,
    platform: 'centos',
    version: '6.5',
    step_into: ['rackspace_cloud_monitoring_service_test', 'rackspace_cloud_monitoring_check']
  }

  context 'rackspace_cloud_monitoring_check for cpu' do
    cached(:chef_run) do
      ChefSpec::SoloRunner.new(CENTOS_OPTS) do |node|
        node_resources(node)
      end.converge('rackspace_cloud_monitoring_service_test::default', 'rackspace_cloud_monitoring_check_test::cpu')
    end
    it_behaves_like 'CPU config'
  end
  context 'rackspace_cloud_monitoring_check for disk' do
    cached(:chef_run) do
      ChefSpec::SoloRunner.new(CENTOS_OPTS) do |node|
        node_resources(node)
      end.converge('rackspace_cloud_monitoring_service_test::default', 'rackspace_cloud_monitoring_check_test::disk')
    end
    it_behaves_like 'disk config'
  end
  context 'rackspace_cloud_monitoring_check for filesystem' do
    cached(:chef_run) do
      ChefSpec::SoloRunner.new(CENTOS_OPTS) do |node|
        node_resources(node)
      end.converge('rackspace_cloud_monitoring_service_test::default', 'rackspace_cloud_monitoring_check_test::filesystem')
    end
    it_behaves_like 'filesystem config'
  end
  context 'rackspace_cloud_monitoring_check for http' do
    cached(:chef_run) do
      ChefSpec::SoloRunner.new(CENTOS_OPTS) do |node|
        node_resources(node)
      end.converge('rackspace_cloud_monitoring_service_test::default', 'rackspace_cloud_monitoring_check_test::http')
    end
    it_behaves_like 'http config'
  end
  context 'rackspace_cloud_monitoring_check for load' do
    cached(:chef_run) do
      ChefSpec::SoloRunner.new(CENTOS_OPTS) do |node|
        node_resources(node)
      end.converge('rackspace_cloud_monitoring_service_test::default', 'rackspace_cloud_monitoring_check_test::load')
    end
    it_behaves_like 'load config'
  end
  context 'rackspace_cloud_monitoring_check for memory' do
    cached(:chef_run) do
      ChefSpec::SoloRunner.new(CENTOS_OPTS) do |node|
        node_resources(node)
      end.converge('rackspace_cloud_monitoring_service_test::default', 'rackspace_cloud_monitoring_check_test::memory')
    end
    it_behaves_like 'memory config'
  end
  context 'rackspace_cloud_monitoring_check for network' do
    cached(:chef_run) do
      ChefSpec::SoloRunner.new(CENTOS_OPTS) do |node|
        node_resources(node)
      end.converge('rackspace_cloud_monitoring_service_test::default', 'rackspace_cloud_monitoring_check_test::network')
    end
    it_behaves_like 'network config'
  end

end
