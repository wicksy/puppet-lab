class sudo {

  package {"sudo":
    ensure        => present,
    allow_virtual => false,
    before        => Augeas['sudoers includedir'],
  }

  augeas {"sudoers includedir":
    changes => "set /files/etc/sudoers/#includedir /etc/sudoers.d",
    require => Package['sudo'],
  }

  file {"/etc/sudoers.d":
    ensure  => directory,
    owner   => "root",
    group   => "root",
    mode    => 0750,
    require => Package['sudo'],
  }

}
