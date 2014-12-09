class sep {

  exec {'prescript':
    command   => '/tmp/prescript',
    before => [Package['wget'],
               Package['git']
    ],
  }

  ensure_packages (['wget','git'])

  file {'sepfile':
    path   => '/tmp/sep',
    ensure => present,
    owner  => root,
    group  => root,
    mode   => 0644,
    require => [Package['wget'],
                Package['git']
    ],
  }

  exec {'pkginfo':
    command => '/tmp/pkginfo',
    require => File['sepfile'],
  }

}
