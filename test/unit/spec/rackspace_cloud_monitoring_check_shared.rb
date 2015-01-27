shared_examples_for 'CPU config' do
  it 'generates cpu agent yaml config' do
    expect(chef_run).to render_file('/etc/rackspace-monitoring-agent.conf.d/cpu.yaml').with_content('agent.cpu')
  end
end

shared_examples_for 'disk config' do
  it 'generates disk agent yaml config' do
    expect(chef_run).to render_file('/etc/rackspace-monitoring-agent.conf.d/disk.yaml').with_content('agent.disk')
  end
end

shared_examples_for 'filesystem config' do
  it 'generates filesystem agent yaml config' do
    expect(chef_run).to render_file('/etc/rackspace-monitoring-agent.conf.d/filesystem.yaml').with_content('agent.filesystem')
  end
end

shared_examples_for 'http config' do
  it 'generates http agent yaml config' do
    expect(chef_run).to render_file('/etc/rackspace-monitoring-agent.conf.d/http.yaml').with_content('remote.http')
  end
end

shared_examples_for 'load config' do
  it 'generates load agent yaml config' do
    expect(chef_run).to render_file('/etc/rackspace-monitoring-agent.conf.d/load.yaml').with_content('agent.load')
  end
end

shared_examples_for 'memory config' do
  it 'generates memory agent yaml config' do
    expect(chef_run).to render_file('/etc/rackspace-monitoring-agent.conf.d/memory.yaml').with_content('agent.memory')
  end
end

shared_examples_for 'network config' do
  it 'generates network agent yaml config' do
    expect(chef_run).to render_file('/etc/rackspace-monitoring-agent.conf.d/network.yaml').with_content('agent.network')
  end
end

shared_examples_for 'agent with default config' do |resource_name|
  it 'generates agent yaml config with default value' do
    params = [
      'disabled: false',
      'period: 90',
      'timeout: 30'
    ]
    params.each do |param|
      expect(chef_run).to render_file("/etc/rackspace-monitoring-agent.conf.d/#{resource_name}.yaml").with_content(param)
    end
  end
end
