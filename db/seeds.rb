require('pry')
require_relative('../models/account')
require_relative('../models/tag')
require_relative('../models/merchant')
require_relative('../models/transaction')

Transaction.delete_all()
Account.delete_all()
Tag.delete_all()
Merchant.delete_all()

account = Account.new(
  {
    'first_name' => 'Conor',
    'sur_name' => 'Wilson',
    'budget' => '100'
  }
)

tag1 = Tag.new(
  {
    'name' => 'groceries'
  }
)

tag2 = Tag.new(
  {
    'name' => 'gas/electric'
  }
)

tag3 = Tag.new(
  {
    'name' => 'rent/mortgage'
  }
)

merchant1 = Merchant.new(
  {
    'name' => 'Tesco'
  }
)

merchant2 = Merchant.new(
  {
    'name' => 'British Gas'
  }
)

merchant3 = Merchant.new(
  {
    'name' => 'Lloyds'
  }
)

account.save()

tag1.save()
tag2.save()
tag3.save()

merchant1.save()
merchant2.save()
merchant3.save()

transaction1 = Transaction.new(
  {
    'amount' => '20.00',
    'merchant_id' => merchant1.id,
    'tag_id' => tag1.id,
    'transaction_date' => Time.now(),
    'transaction_time' => Time.now()
  }
)

transaction2 = Transaction.new(
  {
    'amount' => '440.00',
    'merchant_id' => merchant3.id,
    'tag_id' => tag3.id,
    'transaction_date' => Time.now(),
    'transaction_time' => Time.now()
  }
)


transaction1.save()
transaction2.save()

binding.pry
nil
