class squid {

  package {"squid":
    ensure        => installed,
    allow_virtual => false,
    before        => Service["squid"],
  }

  service {"squid":
    ensure  => running,
    enable  => true,
    require => Package["squid"],
  }

}
