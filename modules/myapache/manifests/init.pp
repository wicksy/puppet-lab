class myapache {
    package { 'httpd':
          ensure => installed,
          before => Service['httpd'],
    }
    package {'php':
          ensure => installed,
          before => Service['httpd'],
    }

    service { 'httpd':
          ensure     => running,
          enable     => true,
          subscribe  => File['/etc/httpd/conf/httpd.conf'],
    }

    file { '/etc/httpd/conf/httpd.conf':
          ensure  => file,
          mode    => 644,
          owner   => root,
          group   => root,
          require => Package['httpd'],
          source  => "puppet:///modules/myapache/httpd.conf",
    }

    file { '/var/www/html/404.php':
          ensure           => file,
          mode             => 644,
          owner            => root,
          group            => root,
          require          => Package['httpd'],
          source => "puppet:///modules/myapache/404.php",
    }

    myapache::vhost {'testhost':
      port       => 8081,
      docroot    => '/var/www-testhost',
      priority   => 25,
      servername => 'puppet',
    }

}
