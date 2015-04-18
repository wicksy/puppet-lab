class wicksy {
  user {theboywicks:
    ensure     => present,
    managehome => yes,
  }
  file {"/root/tmp":
    ensure => directory,
    owner  => root,
    group  => root,
    mode   => 0755,
  }
  file {"/root/tmp/mytest.sh":
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => 755,
    source  => 'puppet:///modules/wicksy/mytest.sh',
    require => File['/root/tmp'],
  }
  exec {"mytest":
    command => "/root/tmp/mytest.sh",
    returns => [0,10,20,30],
    require => File['/root/tmp/mytest.sh'],
  }
}
