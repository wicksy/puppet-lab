puppet-lab
==========
Test repo with modules et al from home puppet lab

.
|-- README.md
|-- data
|   |-- pe_accounts_groups_hash.yaml
|   `-- pe_accounts_users_hash.yaml
|-- hiera.yaml
|-- hierdata
|   `-- common.yaml
|-- install
|   |-- README
|   |-- agent.answers
|   `-- agent.install
|-- manifests
|   |-- backup.site
|   |-- nodes
|   |   `-- githosts.pp
|   |-- nodes.pp
|   `-- site.pp
`-- modules
    |-- accounts
    |   |-- files
    |   |-- manifests
    |   |   |-- init.pp
    |   |   `-- virtual.pp
    |   `-- templates
    |-- audit
    |   |-- files
    |   |-- manifests
    |   |   `-- init.pp
    |   `-- templates
    |-- custom
    |   `-- lib
    |       `-- facter
    |           `-- wicksy.rb
    |-- human
    |   |-- files
    |   |-- manifests
    |   |   |-- init.pp
    |   |   `-- user.pp
    |   `-- templates
    |       `-- basher.erb
    |-- myapache
    |   |-- files
    |   |   |-- 404.php
    |   |   `-- httpd.conf
    |   |-- manifests
    |   |   |-- init.pp
    |   |   `-- vhost.pp
    |   `-- templates
    |       `-- vhost-default.conf.erb
    |-- myclass
    |   |-- files
    |   |-- manifests
    |   |   `-- init.pp
    |   `-- templates
    |-- mymod
    |   |-- files
    |   |-- manifests
    |   |   |-- init.pp
    |   |   `-- wicksy.pp
    |   `-- templates
    |-- myntp
    |   |-- files
    |   |   |-- CentOS.ntp
    |   |   |-- debian.ntp
    |   |   |-- redhat.ntp -> CentOS.ntp
    |   |   `-- ubuntu.ntp -> debian.ntp
    |   |-- manifests
    |   |   `-- init.pp
    |   `-- templates
    |       |-- CentOS.ntp.erb
    |       |-- debian.ntp.erb
    |       |-- redhat.ntp.erb
    |       `-- ubuntu.ntp.erb
    |-- myssh
    |   |-- files
    |   |   `-- sshd_config
    |   |-- manifests
    |   |   `-- init.pp
    |   `-- templates
    |-- sep
    |   `-- manifests
    |       `-- init.pp
    `-- wicksy
        |-- files
        |   `-- mytest.sh
        |-- manifests
        |   `-- init.pp
        `-- templates

47 directories, 41 files
