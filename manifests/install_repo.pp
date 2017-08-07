class fluent_bit::install_repo inherits fluent_bit {
  case $facts['osfamily'] {
    'redhat': {
      yumrepo { $fluent_bit::repo_name:
        descr    => $fluent_bit::repo_desc,
        baseurl  => $fluent_bit::repo_url,
        enabled  => $fluent_bit::repo_enabled,
        gpgcheck => $fluent_bit::repo_gpgcheck,
        gpgkey   => $fluent_bit::repo_gpgkey,
        notify   => Exec['rpmkey'],
      }

      exec { 'rpmkey':
        command     => "rpm --import ${fluent_bit::repo_gpgkey}",
        path        => '/bin:/usr/bin',
        refreshonly => true,
      }
    }

    'debian': {
      apt::source { $fluent_bit::repo_name:
        location     => $fluent_bit::repo_url,
        comment      => $fluent_bit::repo_desc,
        repos        => 'main',
        architecture => 'amd64',
        release      => $fluent_bit::distro_codename,
        key          => {
          id     => $fluent_bit::repo_gpgkeyid,
          source => $fluent_bit::repo_gpgkey,
        },
        include      => {
          'src' => false,
          'deb' => true,
        },
      }

      Class['Apt::Update'] -> Package[$fluent_bit::package_name]
    }

    default: {
      fail("Unsupported os family: ${facts['osfamily']}")
    }
  }
}
