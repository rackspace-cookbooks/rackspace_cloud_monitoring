# comments!

rackspace_cloud_monitoring_check 'filesystem' do
  type 'filesystem'
  target '/var'
  alarm true
  action :create
end
