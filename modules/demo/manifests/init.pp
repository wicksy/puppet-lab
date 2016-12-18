class demo {
  package {"httpd":
    ensure        => installed,
    allow_virtual => false,
    before        => Service['httpd'],
  }

  service {"httpd":
   ensure    => running,
   enable    => true,
   require   => Package['httpd'],
  }

  file {"/etc/httpd/conf/httpd.conf":
    path    => "/etc/httpd/conf/httpd.conf",
    owner   => "root",
    group   => "root",
    mode    => "0644",
    source  => "puppet:///modules/${module_name}/httpd.conf",
    require => Package['httpd'],
    notify  => Service['httpd'],
  }

  file {"/var/www/html/index.html":
   ensure  => file,
   owner   => "root",
   group   => "root",
   mode    => "0644",
   source  => "puppet:///modules/${module_name}/index.html",
   require => Package['httpd'],
  }

  file {"/etc/httpd/conf.d/01-demo.conf":
    path    => "/etc/httpd/conf.d/01-demo.conf",
    owner   => "root",
    group   => "root",
    mode    => "0644",
    source  => "puppet:///modules/${module_name}/01-demo.conf",
    require => Package['httpd'],
    notify  => Service['httpd'],
  }

  file {"/var/www/app":
    ensure  => directory,
    owner   => "apache",
    group   => "apache",
    mode    => "0750",
    require => Package['httpd'],
  }

  file {"/var/www/app/index.html":
    ensure  => file,
    owner   => "apache",
    group   => "apache",
    mode    => "0640",
    source  => "puppet:///modules/${module_name}/appindex.html",
    require => File['/var/www/app'],
  }
}
