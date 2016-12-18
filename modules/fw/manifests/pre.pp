class fw::pre {

  Firewall {
    require => undef,
  }

  # Allow rules
  #
  firewall {"005 accept all icmp":
    chain  => 'INPUT',
    proto  => 'icmp',
    action => 'accept',
  }

  firewall {"010 accept all inbound from lo interface":
    chain   => 'INPUT',
    proto   => 'all',
    iniface => 'lo',
    action  => 'accept',
  }

  firewall {"010 accept all outbound to lo interface":
    chain       => 'OUTPUT',
    proto       => 'all',
    outiface    => 'lo',
    action      => 'accept',
  }

  firewall {"020 accept inbound related established rules":
    chain  => 'INPUT',
    proto  => 'all',
    state  => ['RELATED','ESTABLISHED'],
    action => 'accept',
  }

  firewall {"030 accept outbound related established rules":
    chain  => 'OUTPUT',
    proto  => 'all',
    state  => ['RELATED','ESTABLISHED'],
    action => 'accept',
  }

  firewall {"100 allow outbound icmp type 8 (ping)":
    chain  => 'OUTPUT',
    proto  => 'icmp',
    icmp   => 'echo-request',
    action => 'accept',
  }

  firewall {"100 allow outbound DNS lookups":
      chain  => 'OUTPUT',
      state  => ['NEW'],
      dport  => '53',
      proto  => 'udp',
      action => 'accept',
  }

  firewall {"100 allow outbound traceroute":
      chain  => 'OUTPUT',
      state  => ['NEW'],
      dport  => '33434-33523',
      sport  => '32769-65535',
      proto  => 'udp',
      action => 'accept',
  }

  firewall {"100 allow inbound traceroute":
      chain  => 'INPUT',
      state  => ['NEW'],
      dport  => '33434-33523',
      sport  => '32769-65535',
      proto  => 'udp',
      action => 'accept',
  }

  firewall {"100 allow outbound DHCP":
      chain  => 'OUTPUT',
      state  => ['NEW'],
      dport  => '67',
      proto  => 'udp',
      action => 'accept',
  }

  firewall {"100 allow outbound NTP":
      chain  => 'OUTPUT',
      state  => ['NEW'],
      dport  => '123',
      proto  => 'udp',
      action => 'accept',
  }

  firewall {"200 allow inbound SSH":
    chain  => 'INPUT',
    state  => ['NEW'],
    dport  => '22',
    proto  => 'tcp',
    action => 'accept',
  }

  firewall {"200 allow outbound SSH":
    chain       => 'OUTPUT',
    state       => ['NEW'],
    dport       => '22',
    proto       => 'tcp',
    action      => 'accept',
  }

  firewall {"210 allow outbound SEP traffic":
    chain       => 'OUTPUT',
    state       => ['NEW'],
    dport       => ['7070','8014'],
    proto       => 'tcp',
    action      => 'accept',
  }

  firewall {"220 allow inbound Foreman Puppet":
    chain  => 'INPUT',
    state  => ['NEW'],
    sport  => '8140',
    proto  => 'tcp',
    action => 'accept',
  }

  firewall {"220 allow outbound Foreman Puppet":
    chain       => 'OUTPUT',
    state       => ['NEW'],
    dport       => '8140',
    proto       => 'tcp',
    action      => 'accept',
  }

  firewall {"225 allow outbound proxy web":
    chain       => 'OUTPUT',
    state       => ['NEW'],
    dport       => '8080',
    proto       => 'tcp',
    action      => 'accept',
  }

}
