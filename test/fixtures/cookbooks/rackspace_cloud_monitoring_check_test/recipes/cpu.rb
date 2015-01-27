# comments!

rackspace_cloud_monitoring_check 'cpu' do
  type 'cpu'
  alarm true
  action :create
end
