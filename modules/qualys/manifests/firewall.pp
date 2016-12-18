class qualys::firewall {

  include qualys

  firewall {"025 accept all inbound from Qualys":
    chain  => 'INPUT',
    state  => ['NEW'],
    source => '192.168.1.134',
    proto  => 'all',
    action => 'accept',
  }

}
