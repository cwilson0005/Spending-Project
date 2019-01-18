require_relative('../models/account')

account = Account.new(
  {
    'first_name' => 'Conor',
    'sur_name' => 'Wilson',
    'budget' => '100'
  }
)

account.save()
