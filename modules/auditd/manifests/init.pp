class auditd {

  package {"audit":
    ensure        => installed,
    allow_virtual => false,
    before        => Service["auditd"],
  }

  service {"auditd":
    ensure  => running,
    enable  => true,
    require => Package["audit"],
  }

}
