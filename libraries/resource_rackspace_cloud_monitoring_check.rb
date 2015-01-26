require 'chef/resource/lwrp_base'

class Chef
  class Resource
    # Resource definition for rackspace_cloud_monitoring_check
    class RackspaceCloudMonitoringCheck < Chef::Resource::LWRPBase
      self.resource_name = :rackspace_cloud_monitoring_check
      actions :create, :delete, :enable, :disable
      default_action :create

      attribute :alarm, kind_of: [TrueClass, FalseClass], default: false
      attribute :period, kind_of: Fixnum, default: 90
      attribute :timeout, kind_of: Fixnum, default: 30
      attribute :critical, kind_of: Fixnum, default: 95
      attribute :warning, kind_of: Fixnum, default: 90
      attribute :cookbook, kind_of: String, default: 'rackspace_cloud_monitoring'
      attribute :template, kind_of: String, default: nil
      attribute :type, kind_of: String, default: nil
      attribute :variables, kind_of: Hash, default: {}
    end
  end
end
