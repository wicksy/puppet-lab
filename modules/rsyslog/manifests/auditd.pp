class rsyslog::auditd {

  include rsyslog
  include auditd

  file {"audisp.syslog.conf":
    path    => "/etc/audisp/plugins.d/syslog.conf",
    owner   => "root",
    group   => "root",
    mode    => 0640,
    source  => "puppet:///modules/${module_name}/audisp.syslog.conf",
    links   => follow,
    require => Package["audit"],
    notify  => Service["auditd"],
  }

  file {"00-auditd.conf":
    path    => "/etc/rsyslog.d/00-auditd.conf",
    owner   => "root",
    group   => "root",
    mode    => 0644,
    source  => "puppet:///modules/${module_name}/00-auditd.conf",
    links   => follow,
    require => Package["rsyslog"],
    notify  => Service["rsyslog"],
  }

}
