class squid::rsyslog {

  include squid
  include rsyslog

  file {"01-squid.conf":
    path    => "/etc/rsyslog.d/01-squid.conf",
    owner   => "root",
    group   => "root",
    mode    => 0644,
    source  => "puppet:///modules/${module_name}/rsyslog/01-squid.conf",
    links   => follow,
    require => Package["rsyslog"],
    notify  => Service["rsyslog"],
  }

}
