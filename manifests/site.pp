
## site.pp ##

import "nodes"
import "nodes/*.pp"

# This file (/etc/puppetlabs/puppet/manifests/site.pp) is the main entry point
# used when an agent connects to a master and asks for an updated configuration.
#
# Global objects like filebuckets and resource defaults should go in this file,
# as should the default node definition. (The default node can be omitted
# if you use the console and don't define any other nodes in site.pp. See
# http://docs.puppetlabs.com/guides/language_guide.html#nodes for more on
# node definitions.)

## Active Configurations ##

# PRIMARY FILEBUCKET
# This configures puppet agent and puppet inspect to back up file contents when
# they run. The Puppet Enterprise console needs this to display file contents
# and differences.

# Define filebucket 'main':
filebucket { 'main':
  server => 'learn.localdomain',
  path   => false,
}

# Make filebucket 'main' the default backup location for all File resources:
File { backup => 'main' }

class profile::base {
  include myntp
  include myapache
  include myssh
  include human
  class {'myclass':
    myname => 'Johnny Five',
    myage  => 105,
  }
}

class profile::bonduser {
  user {'bond':
    ensure     => present,
    home       => '/home/bond',
    managehome => true,
    shell      => '/bin/bash',
  }
}

class profile::agent {
  user {'wiggo':
    ensure     => present,
    home       => '/home/wiggo',
    managehome => true,
    shell      => '/bin/bash',
  }
}

class profile::mytest {
  package {'lynx':
    ensure => latest,
  }
}

class profile::githost {
  package {'git':
    ensure => installed,
  }
  user {'gituser':
    ensure     => present,
    home       => '/home/git',
    managehome => true,
    shell      => '/bin/bash',
  }
}

class role {
  include profile::base
}

class role::bonduser inherits role {
  include profile::bonduser
}

class role::agent inherits role {
  include profile::agent
}

class role::mytest inherits role {
  include profile::mytest
}

class role::githost inherits role {
  include profile::githost
  include wicksy
}
