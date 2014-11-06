node 'learn.localdomain' {
  include role::githost
  include role::mytest
  include accounts
  realize (Accounts::Virtual['johndoe'])
}
