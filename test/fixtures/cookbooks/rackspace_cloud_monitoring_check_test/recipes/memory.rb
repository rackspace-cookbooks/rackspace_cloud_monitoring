# comments!

rackspace_cloud_monitoring_check 'memory' do
  type 'memory'
  alarm true
  action :create
end
