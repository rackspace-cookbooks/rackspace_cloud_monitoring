require 'chef/resource/lwrp_base'

class Chef
  class Provider
    # Provider definition for rackspace_cloud_monitoring_check
    class RackspaceCloudMonitoringCheck < Chef::Provider::LWRPBase
      include RackspaceCloudMonitoringCookbook::Helpers

      use_inline_resources if defined?(use_inline_resources)

      def whyrun_supported?
        true
      end

      action :create do
        define_rackspace_monitoring_agent_service
        template "#{agent_conf_d}/#{new_resource.name}.yaml" do
          cookbook new_resource.cookbook
          source parsed_template_from_type
          owner 'root'
          group 'root'
          mode '00644'
          variables( parsed_template_variables('false') )
          notifies 'restart', 'service[rackspace-monitoring-agent]', 'delayed'
        end
      end

      action :delete do
        define_rackspace_monitoring_agent_service
        file "#{agent_conf_d}/#{new_resource.name}.yaml" do
          action :delete
          notifies 'restart', 'service[rackspace-monitoring-agent]', 'delayed'
        end
      end

      action :enable do
        define_rackspace_monitoring_agent_service
        template "#{agent_conf_d}/#{new_resource.name}.yaml" do
          cookbook new_resource.cookbook
          source parsed_template_from_type
          owner 'root'
          group 'root'
          mode '00644'
          variables( parsed_template_variables('false') )
          notifies 'restart', 'service[rackspace-monitoring-agent]', 'delayed'
        end
      end

      action :disable do
        define_rackspace_monitoring_agent_service
        template "#{agent_conf_d}/#{new_resource.name}.yaml" do
          cookbook new_resource.cookbook
          source parsed_template_from_type
          owner 'root'
          group 'root'
          mode '00644'
          variables( parsed_template_variables('true') )
          notifies 'restart', 'service[rackspace-monitoring-agent]', 'delayed'
        end
      end

      def define_rackspace_monitoring_agent_service
        # FIXME
        # Workaround as "service 'rackspace-monitoring-agent'" (defined in provider_rackspace_cloud_monitoring_service) is not available
        service 'rackspace-monitoring-agent' do
          supports start: true, status: true, stop: true, restart: true
          action :nothing
        end
      end
    end
  end
end
