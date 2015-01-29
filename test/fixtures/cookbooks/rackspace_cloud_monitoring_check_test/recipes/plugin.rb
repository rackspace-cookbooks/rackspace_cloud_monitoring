# comments!

rackspace_cloud_monitoring_check 'plugin' do
  type 'plugin'
  plugin_url 'https://raw.githubusercontent.com/racker/rackspace-monitoring-agent-plugins-contrib/master/chef_node_checkin.py'
  plugin_args '--debug'
  plugin_filename 'awesome_plugin.py'
  alarm true
  action :create
end
