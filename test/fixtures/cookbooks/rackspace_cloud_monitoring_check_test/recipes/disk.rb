# comments!

rackspace_cloud_monitoring_check 'disk' do
  type 'disk'
  target '/dev/xda1'
  alarm true
  action :create
end
