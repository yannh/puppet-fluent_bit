class fluent_bit::params {
  $repo_install = true
  $repo_name = 'fluentbit'
  $repo_desc = 'fluentbit'

  case $facts['osfamily'] {
    'debian': {
      $distro_id = downcase($facts['lsbdistid'])
      $repo_url = "http://packages.fluentbit.io/${distro_id}"
    }

    default: {
      fail("Unsupported osfamily ${facts['osfamily']}")
    }
  }

  $repo_enabled = true
  $repo_gpgcheck = true
  $repo_gpgkey = 'http://packages.fluentbit.io/fluentbit.key'
  $repo_gpgkeyid = 'F209D8762A60CD49E680633B4FF8368B6EA0722A'

  $package_name = 'td-agent-bit'
  $package_ensure = present

  $service_name = 'td-agent-bit'
  $service_ensure = running
  $service_enable = true
  $service_manage = true

  $config_file = '/etc/td-agent-bit/td-agent-bit.conf'
  $config_path = '/etc/td-agent-bit/config.d'
  $config_owner = 'root'
  $config_group = 'root'
  $configs = {}
}
