class squid::firewall {

  include squid

  firewall {"000 log all external input chain":
    chain      => 'INPUT',
    jump       => 'LOG',
    log_level  => '6',
    log_prefix => '[IPTABLES INPUT] logged ',
    proto      => 'all',
    source     => '! 192.168.0.1/24',
    before     => undef,
  }

  firewall {"000 log all external forward chain":
    chain       => 'FORWARD',
    jump        => 'LOG',
    log_level   => '6',
    log_prefix  => '[IPTABLES FORWARD] logged ',
    proto       => 'all',
    destination => '! 192.168.0.1/24',
    before      => undef,
  }

  firewall {"000 log all external output chain":
    chain       => 'OUTPUT',
    jump        => 'LOG',
    log_level   => '6',
    log_prefix  => '[IPTABLES OUTPUT] logged ',
    proto       => 'all',
    destination => '! 192.168.0.1/24',
    before      => undef,
  }

  firewall {"300 allow inbound proxy web":
    chain  => 'INPUT',
    state  => ['NEW'],
    dport  => '8080',
    sport  => '1024-65535',
    proto  => 'tcp',
    action => 'accept',
  }

  firewall {"310 allow outbound HTTP":
    chain  => 'OUTPUT',
    state  => ['NEW'],
    dport  => '80',
    proto  => 'tcp',
    action => 'accept',
  }

  firewall {"320 allow outbound HTTPS":
    chain  => 'OUTPUT',
    state  => ['NEW'],
    dport  => '443',
    proto  => 'tcp',
    action => 'accept',
  }

}
