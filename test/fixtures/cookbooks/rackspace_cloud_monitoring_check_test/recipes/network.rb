# comments!

rackspace_cloud_monitoring_check 'network' do
  type 'network'
  target 'eth0'
  alarm true
  action :create
end
