
class myntp {
    $pkg = "ntp"
    $ntpconf = "/etc/ntp.conf"

    case $operatingsystem {
        centos, redhat: { $service = "ntpd"
                          $servers = [ "0.centos.pool.ntp.org",
                                       "1.centos.pool.ntp.org",
                                       "2.centos.pool.ntp.org",
                                       "3.centos.pool.ntp.org", ]
        }
        debian, ubuntu: { $service = "ntp" 
                          $servers = [ "0.debian.pool.ntp.org iburst",
                                       "1.debian.pool.ntp.org iburst",
                                       "2.debian.pool.ntp.org iburst",
                                       "3.debian.pool.ntp.org iburst", ]
        }
        default:  { fail("OS version not recognised")}
    }

    $source = "puppet:///modules/myntp/${operatingsystem}.ntp"
    $_servers = $servers

    package {$pkg:
        ensure => installed,
    }

    service {$service:
        ensure    => running,
        enable    => true,
        require   => Package['ntp'],
        subscribe => File[$ntpconf],
    }

    file {$ntpconf:
        ensure  => file,
        owner   => root,
        group   => root,
        mode    => 644,
        require => Package[$pkg],
        content => template("myntp/${operatingsystem}.ntp.erb"),
        #source  => $source,
    }
}
