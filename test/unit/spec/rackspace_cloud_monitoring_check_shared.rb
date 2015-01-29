shared_examples_for 'agent config' do |agent|
  it 'calls rackspace_cloud_monitoring_check resource' do
    expect(chef_run).to create_rackspace_cloud_monitoring_check(agent)
  end
  it 'restarts rackspace-monitoring-agent service' do
    expect(chef_run.template("/etc/rackspace-monitoring-agent.conf.d/#{agent}.yaml")).to notify('service[rackspace-monitoring-agent]').to(:restart).delayed
  end
  it "generates #{agent} agent yaml config" do
    expect(chef_run).to render_file("/etc/rackspace-monitoring-agent.conf.d/#{agent}.yaml").with_content(agent)
  end
  it 'generates agent yaml config with default value' do
    params = [
      'disabled: false',
      'period: 90',
      'timeout: 30'
    ]
    params.each do |param|
      expect(chef_run).to render_file("/etc/rackspace-monitoring-agent.conf.d/#{agent}.yaml").with_content(param)
    end
  end
end
