class rsyslog::secure {

  include rsyslog

  file {"01-secure.conf":
    path    => "/etc/rsyslog.d/01-secure.conf",
    owner   => "root",
    group   => "root",
    mode    => 0644,
    source  => "puppet:///modules/${module_name}/01-secure.conf",
    links   => follow,
    require => Package["rsyslog"],
    notify  => Service["rsyslog"],
  }

}
