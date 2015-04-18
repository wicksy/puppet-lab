node 'learn.localdomain' {
  include stdlib
  include role::githost
  include role::mytest
  include accounts
  realize (Accounts::Virtual['johndoe'])
  include sep
}
