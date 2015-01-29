# comments!

rackspace_cloud_monitoring_check 'agent.load' do
  type 'agent.load'
  alarm true
  action :create
end
