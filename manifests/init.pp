# Class fluent_bit install, configures and manages the fluent_bit (td-agent)
# service.
#
class fluent_bit (
  Boolean $repo_install = $::fluent_bit::params::repo_install,
  String $repo_name = $::fluent_bit::params::repo_name,
  String $repo_desc = $::fluent_bit::params::repo_desc,
  String $repo_url = $::fluent_bit::params::repo_url,
  Boolean $repo_enabled = $::fluent_bit::params::repo_enabled,
  Boolean $repo_gpgcheck = $::fluent_bit::params::repo_gpgcheck,
  String $repo_gpgkey = $::fluent_bit::params::repo_gpgkey,
  String $repo_gpgkeyid = $::fluent_bit::params::repo_gpgkeyid,
  String $package_name = $::fluent_bit::params::package_name,
  String $package_ensure = $::fluent_bit::params::package_ensure,
  String $service_name = $::fluent_bit::params::service_name,
  String $service_ensure = $::fluent_bit::params::service_ensure,
  Boolean $service_enable = $::fluent_bit::params::service_enable,
  Boolean $service_manage = $::fluent_bit::params::service_manage,
  Optional[String] $service_provider = $::fluent_bit::params::service_provider,
  String $config_file = $::fluent_bit::params::config_file,
  String $config_path = $::fluent_bit::params::config_path,
  String $config_owner = $::fluent_bit::params::config_owner,
  String $config_group = $::fluent_bit::params::config_group,
  Hash $configs = $::fluent_bit::params::configs,
) inherits fluent_bit::params {
  contain fluent_bit::install
  contain fluent_bit::config
  contain fluent_bit::service

  Class['Fluent_bit::Install'] ->
  Class['Fluent_bit::Config'] ->
  Class['Fluent_bit::Service']
}
