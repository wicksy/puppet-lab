class rsyslog {

  package {"rsyslog":
    ensure        => installed,
    allow_virtual => false,
    before        => Service["rsyslog"],
  }

  service {"rsyslog":
    ensure  => running,
    enable  => true,
    require => Package["rsyslog"],
  }

}
