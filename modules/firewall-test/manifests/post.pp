class firewall-test::post {

  # Deny rules
  #
  firewall {"900 log rejected input chain":
    chain      => 'INPUT',
    jump       => 'LOG',
    log_level  => '6',
    log_prefix => '[IPTABLES INPUT] rejected ',
    proto      => 'all',
    before     => undef,
  }

  firewall {"900 log rejected forward chain":
    chain      => 'FORWARD',
    jump       => 'LOG',
    log_level  => '6',
    log_prefix => '[IPTABLES FORWARD] rejected ',
    proto      => 'all',
    before     => undef,
  }

  firewall {"900 log rejected output chain":
    chain      => 'OUTPUT',
    jump       => 'LOG',
    log_level  => '6',
    log_prefix => '[IPTABLES OUTPUT] rejected ',
    proto      => 'all',
    before     => undef,
  }

  firewall {"910 deny all other input requests":
    chain  => 'INPUT',
    action => 'reject',
    proto  => 'all',
    before => undef,
  }

  firewall {"910 deny all other forward requests":
    chain  => 'FORWARD',
    action => 'reject',
    proto  => 'all',
    before => undef,
  }

  firewall {"910 deny all other output requests":
    chain  => 'OUTPUT',
    action => 'reject',
    proto  => 'all',
    before => undef,
  }
}
