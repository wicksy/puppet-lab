class services::postfix {

  service {"postfix":
    ensure => stopped,
    enable => false,
  }

}
