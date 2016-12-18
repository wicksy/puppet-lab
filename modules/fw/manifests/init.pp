class fw {

  # Apply default iptables rules 

  # iptables purge
  resources { "firewall":
    purge => true,
  }

  Firewall {
    before  => Class['fw::post'],
    require => Class['fw::pre'],
  }

  class {['fw::pre',
          'fw::post']:
  }

  service {'iptables':
    name   => 'iptables',
    enable => 'true',
  }

}
