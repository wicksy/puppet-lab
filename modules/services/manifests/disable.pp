class services::disable {

  service {"ttyS0":
    provider => "upstart",
    ensure   => stopped,
    enable   => false,
  }

  service {"autofs":
    ensure => stopped,
    enable => false,
  }

  service {"certmonger":
    ensure => stopped,
    enable => false,
  }

  service {"cpuspeed":
    ensure => stopped,
    enable => false,
    status => "/usr/bin/pgrep cpuspeed",
  }

  service {"cups":
    ensure => stopped,
    enable => false,
  }

  service {"lvm2-monitor":
    ensure => stopped,
    enable => false,
  }

  service {"mdmonitor":
    ensure => stopped,
    enable => false,
  }

  service {"netfs":
    ensure => stopped,
    enable => false,
  }

  service {"nfslock":
    ensure => stopped,
    enable => false,
  }

  service {"rpcbind":
    ensure => stopped,
    enable => false,
  }

  service {"rhnsd":
    ensure => stopped,
    enable => false,
  }

  service {"rhsmcertd":
    ensure => stopped,
    enable => false,
  }

  service {"rpcgssd":
    ensure => stopped,
    enable => false,
  }

}
