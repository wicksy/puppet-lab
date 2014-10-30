
class myssh  {
    $pkg = "openssh-server"
    $service = "sshd"
    $sshdconf = "/etc/ssh/sshd_config"
    $source = "puppet:///modules/myssh/sshd_config"

    package {$pkg:
        ensure => installed,
    }

    service {$service:
        ensure    => running,
        enable    => true,
        require   => Package['openssh-server'],
        subscribe => File[$sshdconf],
    }

    file {$sshdconf:
        ensure  => file,
        owner   => root,
        group   => root,
        mode    => 600,
        require => Package[$pkg],
        source  => $source,
    }
}
