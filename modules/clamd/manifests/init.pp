class clamd {

  package {"clamd":
    ensure        => installed,
    allow_virtual => false,
    before        => [
      Group['clam'],
      User['clam'],
      Service['clamd'],
    ]
  }

  service {"clamd":
    ensure  => running,
    enable  => true,
    require => Package['clamd'],
  }

  group {"clam":
    name    => "clam",
    ensure  => present,
    before  => User['clam'],
    require => Package['clamd'],
  }

  user {"clam":
    name       => "clam",
    ensure     => present,
    gid        => "clam",
    home       => "/var/lib/clamav",
    comment    => "Clam Anti Virus Checker",
    managehome => false,
    shell      => "/sbin/nologin",
    require    => [
      Group['clam'],
      Package['clamd'],
    ]
  }

}
