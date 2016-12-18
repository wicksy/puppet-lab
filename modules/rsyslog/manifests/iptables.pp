class rsyslog::iptables {

  include rsyslog

  file {"00-iptables.conf":
    path    => "/etc/rsyslog.d/00-iptables.conf",
    owner   => "root",
    group   => "root",
    mode    => 0644,
    source  => "puppet:///modules/${module_name}/00-iptables.conf",
    links   => follow,
    require => Package["rsyslog"],
    notify  => Service["rsyslog"],
  }

}
