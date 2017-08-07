class fluent_bit::service inherits fluent_bit {
  if $fluent_bit::service_manage {
    service { $fluent_bit::service_name:
      ensure     => $fluent_bit::service_ensure,
      enable     => $fluent_bit::service_enable,
      provider   => $fluent_bit::service_provider,
      hasstatus  => true,
      hasrestart => true,
    }
  }
}
