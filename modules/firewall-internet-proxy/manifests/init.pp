class firewall-internet-proxy {

  # Apply iptables rules for Internet facing Proxy Servers

  # iptables purge
  resources { "firewall":
    purge => true,
  }

  Firewall {
    before  => Class['firewall-internet-proxy::post'],
    require => Class['firewall-internet-proxy::pre'],
  }

  class {['firewall-internet-proxy::pre',
          'firewall-internet-proxy::post']:
  }

  service {'iptables':
    name   => 'iptables',
    enable => 'true',
  }
}
