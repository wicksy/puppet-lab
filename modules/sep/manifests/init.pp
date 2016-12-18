class sep {

  include repo
  Class['repo'] -> Class['sep']

  $installscript = "SEPinstall"
  $installpath = "/var/tmp/"
  $installexe = "${installpath}${installscript}"

  package {'jdk.x86_64':
    name            => "jdk",
    ensure          => "1.7.0_71-fcs",
    allow_virtual   => false,
    require         => Package['repo'],
  }

  package {'glibc.i686':
    name            => "glibc.i686",
    ensure          => installed,
    allow_virtual   => false,
  }

  file {"${installexe}":
    ensure => present,
    path   => "${installexe}",
    owner  => root,
    group  => root,
    mode   => 0755,
    source => "puppet:///modules/${module_name}/${installscript}",
    require => [Package['jdk.x86_64'],
                Package['glibc.i686']
               ],
  }

  exec {"${installscript}":
    command => "${installexe}",
    creates => "/opt/Symantec/symantec_antivirus/sav",
    returns => 0,
    require => File[$installexe],
  }

}
