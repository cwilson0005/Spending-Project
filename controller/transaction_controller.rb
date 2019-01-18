require('sinatra')
require('sinatra/reloader') if development?
require('pry')
require_relative( '../models/account.rb' )
require_relative( '../models/merchant.rb' )
require_relative( '../models/transaction.rb' )
require_relative( '../models/tag.rb' )
also_reload( '../models/*' )



binding.pry
nil
