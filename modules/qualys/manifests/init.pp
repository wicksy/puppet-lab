class qualys {

  include sudo

  group {"qualys":
    name   => "qualys",
    ensure => present,
    before => User['qualys'],
  }

  user {"qualys":
    name       => "qualys",
    ensure     => present,
    comment    => "Qualys service account",
    gid        => "qualys",
    home       => "/home/qualys",
    managehome => true,
    shell      => "/bin/bash",
    require    => Group['qualys'],
  }

  ssh_authorized_key {"qualys":
    user    => "qualys",
    type    => "ssh-rsa",
    key     => "SSHKEYFORQUALYSGOESHERE",
    require => User['qualys'],
  }

  file {"/etc/sudoers.d/qualys":
    ensure  => present,
    owner   => "root",
    group   => "root",
    mode    => 640,
    source  => "puppet:///modules/${module_name}/qualys",
    require => File['/etc/sudoers.d'],
  }

}
