# Used to define/realize users on Puppet-managed systems
#
class accounts {
 
  @accounts::virtual { 'johndoe':
    uid             =>  1001,
    realname        =>  'John Doe',
    pass            =>  '$1$xyz$xzXBgP5XZsugGn2gIUDfE/',
  }
}
