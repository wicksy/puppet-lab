class repo {


  $rpmsource = "http://repo:8080/repo/rpm/el/6Server/x86_64/repo-1.0.0-1.el6.noarch.rpm"

  package {"repo":
    name          => "repo",
    ensure        => "latest",
    allow_virtual => false,
    provider      => "rpm",
    source        => "${rpmsource}",
  }
}
