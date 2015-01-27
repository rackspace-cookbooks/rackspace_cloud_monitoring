require 'chef/resource/lwrp_base'

class Chef
  class Resource
    # Resource definition for rackspace_cloud_monitoring_check
    class RackspaceCloudMonitoringCheck < Chef::Resource::LWRPBase
      self.resource_name = :rackspace_cloud_monitoring_check
      actions :create, :delete, :enable, :disable
      default_action :create

      # Common to all checks
      attribute :alarm, kind_of: [TrueClass, FalseClass], default: false
      attribute :alarm_criteria, kind_of: String, default: nil
      attribute :period, kind_of: Fixnum, default: 90
      attribute :timeout, kind_of: Fixnum, default: 30
      attribute :critical, kind_of: Fixnum, default: 95
      attribute :warning, kind_of: Fixnum, default: 90
      attribute :variables, kind_of: Hash, default: {}
      # Required on some checks (filesystem/disk/network)
      attribute :target, kind_of: String, default: nil
      attribute :target_hostname, kind_of: String, default: nil
      attribute :send_warning, kind_of: Fixnum, default: 56_000
      attribute :send_critical, kind_of: Fixnum, default: 76_000
      attribute :recv_warning, kind_of: Fixnum, default: 56_000
      attribute :recv_critical, kind_of: Fixnum, default: 76_000
      # Template config
      attribute :cookbook, kind_of: String, default: 'rackspace_cloud_monitoring'
      attribute :template, kind_of: String, default: nil
      attribute :type, kind_of: String, default: nil
    end
  end
end
