module RackspaceCloudMonitoringCookbook
  # Helpers for the providers
  module Helpers
    include Chef::DSL::IncludeRecipe

    def agent_conf_d
      '/etc/rackspace-monitoring-agent.conf.d'
    end

    def configure_package_repositories
      if %w(rhel fedora).include? node['platform_family']
        yum_repository 'monitoring' do
          description 'Rackspace Cloud Monitoring agent repo'
          baseurl "https://stable.packages.cloudmonitoring.rackspace.com/#{node['platform']}-#{node['platform_version'][0]}-x86_64"
          gpgkey "https://monitoring.api.rackspacecloud.com/pki/agent/#{node['platform']}-#{node['platform_version'][0]}.asc"
          enabled true
          gpgcheck true
          action :add
        end
      else
        apt_repository 'monitoring' do
          uri "https://stable.packages.cloudmonitoring.rackspace.com/#{node['platform']}-#{node['lsb']['release']}-x86_64"
          distribution 'cloudmonitoring'
          components ['main']
          key 'https://monitoring.api.rackspacecloud.com/pki/agent/linux.asc'
          action :add
        end
      end
    end

    def parsed_cloud_credentials_username
      return new_resource.cloud_credentials_username if new_resource.cloud_credentials_username
      fail 'Cloud credential username missing, cannot setup cloud-monitoring (please set :cloud_credentials_username)'
    end

    def parsed_cloud_credentials_api_key
      return new_resource.cloud_credentials_api_key if new_resource.cloud_credentials_api_key
      fail 'Cloud credential api_key missing, cannot setup cloud-monitoring (please set :cloud_credentials_api_key)'
    end

    def parsed_template_from_type
      return new_resource.template if new_resource.template
      case new_resource.type
      when 'memory'
        'memory.conf.erb'
      when 'cpu'
        'cpu.conf.erb'
      when 'load'
        'load.conf.erb'
      when 'filesystem'
        'filesystem.conf.erb'
      when 'disk'
        'disk.conf.erb'
      when 'network'
        'network.conf.erb'
      when 'http'
        'http.conf.erb'
      else
        'custom_check.conf.erb'
      end
    end

    def parsed_template_variables(disabled)
      {
      disabled: disabled,
      alarm: new_resource.alarm,
      period: new_resource.period,
      timeout: new_resource.timeout,
      critical: new_resource.critical,
      warning: new_resource.warning
      }.merge(new_resource.variables)
    end
  end
end
