
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

    ssh_authorized_key { 'laptop':
        user => 'root',
        type => 'ssh-rsa',
        key  => 'AAAAB3NzaC1yc2EAAAABJQAAAIEAtG2nkJrZfRJAA8wEneVpRklQDjpeQL/2MCP07SQP5+s9EAb3KMEbxtDdQNTYXwXP1WHyt0hj3f9dp+tBeoy9WlrEvyA28/NnYa4NW2F9nyOpPSKdDKA6HewFdYLDxTDl+yCdZYLwpuQhw01gM7jni6SQoFuD461t65bHsizIqv0='
    }

    ssh_authorized_key {'root@learn.localdomain':
      user => 'root',
      type => 'ssh-rsa',
      key  => 'AAAAB3NzaC1yc2EAAAABIwAAAQEA1mdI1YVy10P+RiuMPgEs+UZFSNTId6r8m8rPMayU3ZMSdxFhiQLdPPH/JuhMuXAnjW4PzXEyqx4b9F5EtRWP3+SHkEltBTCRXPZtLpjpT3BpAfVPHCIDOqD/rZeNzLumHHmCKe14YGkAtpmahIrA+xrQ8Eewl7xQDLT6UyG4bYyXy4ZKSF9Fh0czwUxJQbwIzv5MlD7A0ut3Is6Vm0rQGLpmlCadS0QUzqClCaCROqMKHFF9VHce1uwGhk95M/TdAFijRRNjXHKdfAYzxEjTWMYiL0CPfGCUk5HCFK5udllhuxonaHp7IVtFnoo0rfOJrmeop+JPGKBg03t+ssdtIw=='
    }
}
