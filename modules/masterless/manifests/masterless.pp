#
# Monolithic manifest for masterless clients
#
node /test[345].localdomain/ {

  file { '/var/log/puppet/puppet.cron.log':
    ensure => file,
    path   => '/var/log/puppet/puppet.cron.log',
    owner  => 'root',
    group  => 'root',
    mode   => 0600,
  }

  cron { 'puppetrun':
    command => "(cd /etc/puppet/modules/ && /usr/bin/git pull && /usr/bin/puppet apply -v --logdest /dev/stdout /etc/puppet/modules/masterless/manifests/masterless.pp) | /usr/bin/tee -a /var/log/puppet/puppet.cron.log",
    user    => 'root',
    minute  => [0,30],
  }

  include auditd
  include fw
  include qualys
  include qualys::firewall
  include services
  include services::disable
  include services::postfix
  include squid
  include squid::config
  include squid::firewall
  include sudo
  class {'time':
    manage_ntp => false,
  }

}

node /webserver[45].localdomain/ {

  file { '/var/log/puppet/puppet.cron.log':
    ensure => file,
    path   => '/var/log/puppet/puppet.cron.log',
    owner  => 'root',
    group  => 'root',
    mode   => 0600,
  }

  cron { 'puppetrun':
    command => "(cd /etc/puppet/modules/ && /usr/bin/git pull && /usr/bin/puppet apply -v --logdest /dev/stdout /etc/puppet/modules/masterless/manifests/masterless.pp) | /usr/bin/tee -a /var/log/puppet/puppet.cron.log",
    user    => 'root',
    minute  => [0,30],
  }

  include auditd
  include fw
  include qualys
  include qualys::firewall
  include services
  include services::disable
  include services::postfix
  include sudo
  class {'time':
    manage_ntp => false,
  }
  include yum
  include yum::firewall

}
