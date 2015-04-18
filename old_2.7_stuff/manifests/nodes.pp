
## nodes.pp ##

# DEFAULT NODE
# Node definitions in this file are merged with node data from the console. See
# http://docs.puppetlabs.com/guides/language_guide.html#nodes for more on
# node definitions.

# The default node definition matches any node lacking a more specific node
# definition. If there are no other nodes in this file, classes declared here
# will be included in every node's catalog, *in addition* to any classes
# specified in the console for that node.

node default {
  # This is where you can declare classes for all nodes.
  # Example:
  #   class { 'my_class': }
  include role
}

# Other nodes

node 'agent2.localdomain' {
  include role::bonduser
}

node /agent[0-9].*/ {
  include role::agent
  include role::mytest
  include wicksy
}

