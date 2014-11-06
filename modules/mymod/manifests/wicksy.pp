define mymod::wicksy (
  $title,
  ) {

    include mymod

    file {'/etc/wicksy':
      ensure  => file,
      mode    => 600,
      owner   => root,
      group   => bin,
      content => 'This is a test file from mymod::wicksy',
    }
  }
