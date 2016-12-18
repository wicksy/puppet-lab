class wicksy {
  file {'/tmp/wicksyfile':
    ensure => present,
    owner  => 'root',
    group  => 'bin',
    mode   => '0600',
  }
}


