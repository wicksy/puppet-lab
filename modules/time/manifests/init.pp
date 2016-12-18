class time ($manage_ntp = true) {

  # servers array for ntp class is picked up using hiera globals
  # /var/lib/hiera/global.yaml (ntp::servers:)
  #
  # node specifics can be set in:
  # /var/lib/hiera/node/$::fqdn.yaml
  #
  # See /etc/hiera.yaml for details
  #

  if $manage_ntp == true {
    notice("NTP will be managed")
    class {"::ntp":
    }
  } else {
    notice("NTP will not be managed")
  }

  file {"/etc/localtime":
    path   => "/etc/localtime",
    ensure => link,
    target => "/usr/share/zoneinfo/UTC",
  }

  file {"/etc/sysconfig/clock":
    path    => "/etc/sysconfig/clock",
    ensure  => present,
    owner   => "root",
    group   => "root",
    mode    => 0644,
    require => Augeas['sysconfig clock'],
  }

  augeas {"sysconfig clock":
    context => "/files/etc/sysconfig/clock",
    lens    => "shellvars.lns",
    incl    => "/etc/sysconfig/clock",
    changes => [
      "set ZONE '\"UTC\"'",
    ];
  }

}
