require_relative('../models/account')
require_relative('../models/tag')
require_relative('../models/merchant')

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
