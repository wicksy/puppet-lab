class squid::config {

  include squid

  file {"squid.conf":
    path    => "/etc/squid/squid.conf",
    owner   => "root",
    group   => "root",
    mode    => 0640,
    source  => "puppet:///modules/${module_name}/squid/${fqdn}.squid.conf",
    links   => follow,
    require => Package["squid"],
    notify  => Service["squid"],
  }

  file {"web_allow":
    path    => "/etc/squid/web_allow",
    owner   => "root",
    group   => "squid",
    mode    => 0644,
    source  => "puppet:///modules/${module_name}/squid/${fqdn}.web_allow",
    links   => follow,
    require => Package["squid"],
    notify  => Service["squid"],
  }

}
