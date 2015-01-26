module RackspaceCloudMonitoringCookbook
  # Helpers for the providers
  module Helpers
    include Chef::DSL::IncludeRecipe
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
  end
end
