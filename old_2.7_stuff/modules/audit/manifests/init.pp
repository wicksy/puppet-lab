class audit {
  file {'/etc/sudoers':
    audit => [ensure, content, owner, group, mode, type]
  }
}
