define human::user ($user = $title) {
    validate_string($user)
    $template = 'human/basher.erb'
    user {$user:
      ensure     => present,
      managehome => true,
    }
    file {"/home/${user}/.bashrc":
      ensure  => file,
      mode    => 0644,
      owner   => $user,
      content => template($template),
      require => User[$user],
    }
}
