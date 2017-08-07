class fluent_bit::config inherits fluent_bit {

  file { $fluent_bit::config_path:
    ensure  => directory,
    owner   => $fluent_bit::config_owner,
    group   => $fluent_bit::config_group,
    mode    => '0750',
    recurse => true,
    force   => true,
    purge   => true,
  } ->

  file { "${fluent_bit::config_file}":
    ensure  => present,
    content => fluent_bit_config($fluent_bit::configs),
    require => Class['Fluent_bit::Install'],
    notify  => Class['Fluent_bit::Service'],
  }
}
