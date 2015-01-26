# rackspace_cloud_monitoring-cookbook

The Rackspace Cloud-monitoring cookbook provides resource primitives (LWRPs) for use in recipes.
The goal is to offer resources to configure [Rackspace Cloud-monitoring](http://www.rackspace.co.uk/cloud/monitoring)

## Supported Platforms

* Centos 6.5
* Ubuntu 12.04
* Ubuntu 14.04

## Attributes

<!---
node['rackspace_cloud_monitoring']['cloud_credentials_username']
node['rackspace_cloud_monitoring']['cloud_credentials_api_key']
-->

## Usage

Place a dependency on the rackspace_cloud_monitoring cookbook in your cookbook's metadata.rb
```
depends 'rackspace_cloud_monitoring'
```
Then, in a recipe:

```
rackspace_cloud_monitoring_service 'default' do
  cloud_credentials_username 'my_user'
  cloud_credentials_api_key 'uc60892165188d7i786p833917a3v7613'
  action [:create, :start]
end
```

## Resources Overview

### rackspace_cloud_monitoring_service
The `rackspace_cloud_monitoring_service` resources manages the basic plumbing needed to get a rackspace-monitoring agent instance running with minimal configuration.

The :create action handles package installation. The internal configuration file contains just enough to get the service up and running, then loads extra configuration from a rackspace-monitoring-agent.conf.d directory.

#### Parameters
* `cloud_credentials_username` - Your cloud username 
* `cloud_credentials_api_key` - Your cloud [api-key](http://www.rackspace.com/knowledge_center/article/view-and-reset-your-api-key)
* `package_name` - Rackspace monitoring agent package name (default to `rackspace-monitoring-agent`)
* `package_action` - Which action to run when `:create` default to `install`
#### Actions
* :create - Configures everything but the underlying operating system service
* :delete - Removes everything
* :start - Starts the underlying operating system service
* :stop- Stops the underlying operating system service
* :restart - Restarts the underlying operating system service
* :reload - Reloads the underlying operating system service
* :disable/:enable Enables/Disables the underlying operating system service

### rackspace_cloud_monitoring::default

<!---
Include `rackspace_cloud_monitoring` in your node's `run_list`:

```json
{
  "run_list": [
    "recipe[rackspace_cloud_monitoring::default]"
  ]
}
```
--->

## Contributing

1. Fork the repository on Github
2. Create a named feature branch (i.e. `add-new-recipe`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request

## License and Authors

Author:: Julien Berard (jujugrrr@gmail.com)
