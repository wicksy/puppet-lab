class mymod {

  $wicksyfact = 'Test fact'

  user {'mymod':
    ensure     => present,
    home       => '/home/mymod',
    comment    => 'Test user for module added thru dashboard',
    managehome => true,
  }
  user {'mymod2':
    ensure     => present,
    managehome => true,
    home       => '/home/mymod2',
    comment    => 'Second user added thru dashboard class',
  }

  mymod::wicksy {'test':
    title => 'This is a test',
  }
}
