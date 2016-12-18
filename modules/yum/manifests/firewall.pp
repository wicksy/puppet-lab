class yum::firewall {

  include yum

  firewall {"310 allow outbound HTTP":
    chain  => 'OUTPUT',
    state  => ['NEW'],
    dport  => '80',
    proto  => 'tcp',
    action => 'accept',
  }

}
