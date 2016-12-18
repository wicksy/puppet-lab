class postfix {

  package {"postfix":
    ensure        => installed,
    allow_virtual => false,
    before        => [
      Group['postfix'],
      User['postfix'],
      Service['postfix'],
    ]
  }

  service {"postfix":
    ensure  => running,
    enable  => true,
    require => Package['postfix'],
  }

  group {"postfix":
    name    => "postfix",
    ensure  => present,
    gid     => 89,
    before  => User['postfix'],
    require => Package['postfix'],
  }

  user {"postfix":
    name       => "postfix",
    ensure     => present,
    gid        => 89,
    home       => "/var/spool/postfix",
    managehome => false,
    shell      => "/sbin/nologin",
    uid        => 89,
    require    => [
      Group['postfix'],
      Package['postfix'],
    ]
  }

}
