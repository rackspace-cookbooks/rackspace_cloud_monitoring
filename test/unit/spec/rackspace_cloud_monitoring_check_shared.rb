shared_examples_for 'CPU config' do
  it 'generates cpu agent yaml config' do
    expect(chef_run).to render_file('/etc/rackspace-monitoring-agent.conf.d/cpu.yaml').with_content('cpu')
  end
end

shared_examples_for 'disk config' do
  it 'generates disk agent yaml config' do
    expect(chef_run).to render_file('/etc/rackspace-monitoring-agent.conf.d/disk.yaml').with_content('disk')
  end
end

shared_examples_for 'filesystem config' do
  it 'generates filesystem agent yaml config' do
    expect(chef_run).to render_file('/etc/rackspace-monitoring-agent.conf.d/filesystem.yaml').with_content('filesystem')
  end
end

shared_examples_for 'http config' do
  it 'generates http agent yaml config' do
    expect(chef_run).to render_file('/etc/rackspace-monitoring-agent.conf.d/http.yaml').with_content('http')
  end
end

shared_examples_for 'load config' do
  it 'generates load agent yaml config' do
    expect(chef_run).to render_file('/etc/rackspace-monitoring-agent.conf.d/load.yaml').with_content('load')
  end
end

shared_examples_for 'memory config' do
  it 'generates memory agent yaml config' do
    expect(chef_run).to render_file('/etc/rackspace-monitoring-agent.conf.d/memory.yaml').with_content('memory')
  end
end

shared_examples_for 'network config' do
  it 'generates network agent yaml config' do
    expect(chef_run).to render_file('/etc/rackspace-monitoring-agent.conf.d/network.yaml').with_content('network')
  end
end
