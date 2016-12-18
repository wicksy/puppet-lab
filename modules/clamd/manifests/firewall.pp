class clamd::firewall {

  include clamd

  firewall {"000 log all external input chain":
    chain      => 'INPUT',
    jump       => 'LOG',
    log_level  => '6',
    log_prefix => '[IPTABLES INPUT] logged ',
    proto      => 'all',
    source     => '! 192.168.1.0/24',
    before     => undef,
  }

  firewall {"000 log all external forward chain":
    chain       => 'FORWARD',
    jump        => 'LOG',
    log_level   => '6',
    log_prefix  => '[IPTABLES FORWARD] logged ',
    proto       => 'all',
    destination => '! 192.168.1.0/24',
    before      => undef,
  }

  firewall {"000 log all external output chain":
    chain       => 'OUTPUT',
    jump        => 'LOG',
    log_level   => '6',
    log_prefix  => '[IPTABLES OUTPUT] logged ',
    proto       => 'all',
    destination => '! 192.168.1.0/24',
    before      => undef,
  }

  firewall {"350 accept inbound CLAM":
    chain  => 'INPUT',
    state  => ['NEW'],
    dport => '3310',
    proto  => 'tcp',
    action => 'accept',
  }

}
