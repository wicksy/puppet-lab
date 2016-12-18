class rsyslog::firewall {

  include rsyslog

  firewall {"330 allow outbound SYSLOG":
    chain  => 'OUTPUT',
    state  => ['NEW'],
    dport  => '601',
    proto  => 'tcp',
    action => 'accept',
  }

}
