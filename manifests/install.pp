class fluent_bit::install inherits fluent_bit {
  if $fluent_bit::repo_install {
    require fluent_bit::install_repo
  }

  package { $fluent_bit::package_name:
    ensure => $fluent_bit::package_ensure,
  }
}
