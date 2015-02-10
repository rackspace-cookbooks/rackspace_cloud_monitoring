shared_examples_for 'agent config' do |agent, filename|
  filename = agent unless filename
  it 'calls rackspace_cloud_monitoring_check resource' do
    expect(chef_run).to create_rackspace_cloud_monitoring_check(agent)
  end
  it 'defines the service rackspace-monitoring-agent' do
    expect(chef_run.service('rackspace-monitoring-agent')).to do_nothing
  end
  it 'restarts rackspace-monitoring-agent service' do
    expect(chef_run.template("/etc/rackspace-monitoring-agent.conf.d/#{filename}.yaml")).to notify('service[rackspace-monitoring-agent]').to(:restart).delayed
  end
  it "generates #{agent} agent yaml config" do
    expect(chef_run).to render_file("/etc/rackspace-monitoring-agent.conf.d/#{filename}.yaml").with_content(agent)
  end
  it 'generates agent yaml config with default value' do
    params = [
      'disabled: false',
      'period: 90',
      'timeout: 30',
      "Check for #{agent}, (type: #{agent})",
      'notification_plan_id: npTechnicalContactsEmail'
    ]
    params.each do |param|
      expect(chef_run).to render_file("/etc/rackspace-monitoring-agent.conf.d/#{filename}.yaml").with_content(param)
    end
  end
end
