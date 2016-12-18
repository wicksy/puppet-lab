class firewall-test {

  # Apply test iptables rules

  # iptables purge
  resources { "firewall":
    purge => true,
  }

  Firewall {
    before  => Class['firewall-test::post'],
    require => Class['firewall-test::pre'],
  }

  class {['firewall-test::pre',
          'firewall-test::post']:
  }

  service {'iptables':
    name   => 'iptables',
    enable => 'true',
  }
}
