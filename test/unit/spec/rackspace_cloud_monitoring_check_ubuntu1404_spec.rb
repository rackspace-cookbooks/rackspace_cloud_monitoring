require_relative 'spec_helper'

describe 'rackspace_cloud_monitoring_check_test::* on Ubuntu 14.04' do
  before do
    stub_resources
  end

  UBUNTU1404_CHECK_OPTS = {
    log_level: LOG_LEVEL,
    platform: 'ubuntu',
    version: '14.04',
    step_into: ['rackspace_cloud_monitoring_service_test', 'rackspace_cloud_monitoring_check']
  }

  context 'rackspace_cloud_monitoring_check for cpu' do
    cached(:chef_run) do
      ChefSpec::SoloRunner.new(UBUNTU1404_CHECK_OPTS) do |node|
        node_resources(node)
      end.converge('rackspace_cloud_monitoring_service_test::default', 'rackspace_cloud_monitoring_check_test::cpu')
    end
    it_behaves_like 'CPU config'
    it_behaves_like 'agent with default config', 'cpu'
  end
  context 'rackspace_cloud_monitoring_check for disk' do
    cached(:chef_run) do
      ChefSpec::SoloRunner.new(UBUNTU1404_CHECK_OPTS) do |node|
        node_resources(node)
      end.converge('rackspace_cloud_monitoring_service_test::default', 'rackspace_cloud_monitoring_check_test::disk')
    end
    it_behaves_like 'disk config'
    it_behaves_like 'agent with default config', 'disk'
  end
  context 'rackspace_cloud_monitoring_check for filesystem' do
    cached(:chef_run) do
      ChefSpec::SoloRunner.new(UBUNTU1404_CHECK_OPTS) do |node|
        node_resources(node)
      end.converge('rackspace_cloud_monitoring_service_test::default', 'rackspace_cloud_monitoring_check_test::filesystem')
    end
    it_behaves_like 'filesystem config'
    it_behaves_like 'agent with default config', 'filesystem'
  end
  context 'rackspace_cloud_monitoring_check for http' do
    cached(:chef_run) do
      ChefSpec::SoloRunner.new(UBUNTU1404_CHECK_OPTS) do |node|
        node_resources(node)
      end.converge('rackspace_cloud_monitoring_service_test::default', 'rackspace_cloud_monitoring_check_test::http')
    end
    it_behaves_like 'http config'
    it_behaves_like 'agent with default config', 'http'
  end
  context 'rackspace_cloud_monitoring_check for load' do
    cached(:chef_run) do
      ChefSpec::SoloRunner.new(UBUNTU1404_CHECK_OPTS) do |node|
        node_resources(node)
      end.converge('rackspace_cloud_monitoring_service_test::default', 'rackspace_cloud_monitoring_check_test::load')
    end
    it_behaves_like 'load config'
    it_behaves_like 'agent with default config', 'load'
  end
  context 'rackspace_cloud_monitoring_check for memory' do
    cached(:chef_run) do
      ChefSpec::SoloRunner.new(UBUNTU1404_CHECK_OPTS) do |node|
        node_resources(node)
      end.converge('rackspace_cloud_monitoring_service_test::default', 'rackspace_cloud_monitoring_check_test::memory')
    end
    it_behaves_like 'memory config'
    it_behaves_like 'agent with default config', 'memory'
  end
  context 'rackspace_cloud_monitoring_check for network' do
    cached(:chef_run) do
      ChefSpec::SoloRunner.new(UBUNTU1404_CHECK_OPTS) do |node|
        node_resources(node)
      end.converge('rackspace_cloud_monitoring_service_test::default', 'rackspace_cloud_monitoring_check_test::network')
    end
    it_behaves_like 'network config'
    it_behaves_like 'agent with default config', 'network'
  end

  context 'rackspace_cloud_monitoring_check built from parameters' do
    cached(:chef_run) do
      ChefSpec::SoloRunner.new(UBUNTU1404_CHECK_OPTS) do |node|
        node_resources(node)
        node.set['rackspace_cloud_monitoring_check_test']['type'] = 'network'
        node.set['rackspace_cloud_monitoring_check_test']['alarm'] = true
        # node.set['rackspace_cloud_monitoring_check_test']['alarm_criteria'] = 'custom_criteria'
        node.set['rackspace_cloud_monitoring_check_test']['period'] = 666
        node.set['rackspace_cloud_monitoring_check_test']['timeout'] = 555
        node.set['rackspace_cloud_monitoring_check_test']['critical'] = 444
        node.set['rackspace_cloud_monitoring_check_test']['warning'] = 333
        node.set['rackspace_cloud_monitoring_check_test']['target'] = 'dummy_eth'
        node.set['rackspace_cloud_monitoring_check_test']['send_warning'] = 66_600
        node.set['rackspace_cloud_monitoring_check_test']['send_critical'] = 55_500
        node.set['rackspace_cloud_monitoring_check_test']['recv_warning'] = 44_400
        node.set['rackspace_cloud_monitoring_check_test']['recv_critical'] = 33_300
      end.converge('rackspace_cloud_monitoring_service_test::default', 'rackspace_cloud_monitoring_check_test::default')
    end
    it 'configure my agent with all me resources parameters' do
      params = [
        'type: agent.network',
        'disabled: false',
        'period: 666',
        'timeout: 555',
        'target: dummy_eth',
        'alarm-network-receive',
        '> 55500',
        '> 66600',
        '> 33300',
        '> 44400',
        'alarm-network-receive',
        'alarm-network-receive'
      ]
      params.each do |param|
        expect(chef_run).to render_file('/etc/rackspace-monitoring-agent.conf.d/network.yaml').with_content(param)
      end
    end
  end

  context 'rackspace_cloud_monitoring_check for network with missing mandatory attribute' do
    cached(:chef_run) do
      ChefSpec::SoloRunner.new(UBUNTU1404_CHECK_OPTS) do |node|
        node_resources(node)
        node.set['rackspace_cloud_monitoring_check_test']['type'] = 'network'
        node.set['rackspace_cloud_monitoring_check_test']['alarm'] = true
      end.converge('rackspace_cloud_monitoring_service_test::default', 'rackspace_cloud_monitoring_check_test::default')
    end
    it_behaves_like 'raise error about missing parameters'
  end
  context 'rackspace_cloud_monitoring_check for disk with missing mandatory attribute' do
    cached(:chef_run) do
      ChefSpec::SoloRunner.new(UBUNTU1404_CHECK_OPTS) do |node|
        node_resources(node)
        node.set['rackspace_cloud_monitoring_check_test']['type'] = 'disk'
        node.set['rackspace_cloud_monitoring_check_test']['alarm'] = true
      end.converge('rackspace_cloud_monitoring_service_test::default', 'rackspace_cloud_monitoring_check_test::default')
    end
    it_behaves_like 'raise error about missing parameters'
  end
  context 'rackspace_cloud_monitoring_check for filesystem with missing mandatory attribute' do
    cached(:chef_run) do
      ChefSpec::SoloRunner.new(UBUNTU1404_CHECK_OPTS) do |node|
        node_resources(node)
        node.set['rackspace_cloud_monitoring_check_test']['type'] = 'filesystem'
        node.set['rackspace_cloud_monitoring_check_test']['alarm'] = true
      end.converge('rackspace_cloud_monitoring_service_test::default', 'rackspace_cloud_monitoring_check_test::default')
    end
    it_behaves_like 'raise error about missing parameters'
  end
end
