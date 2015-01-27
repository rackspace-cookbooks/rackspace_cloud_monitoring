# comments!

hostname = 'dummyhost.com'
rackspace_cloud_monitoring_check 'http' do
  type 'http'
  target_hostname hostname
  alarm true
  variables 'url' => "http://#{hostname}/healthcheck",
            'body' => 'Status OK'
  action :create
end
