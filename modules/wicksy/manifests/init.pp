class wicksy {
  user {theboywicks:
    ensure     => present,
    managehome => yes,
  }
  exec {"mytest":
    command => "/root/tmp/mytest.sh",
  }
}
