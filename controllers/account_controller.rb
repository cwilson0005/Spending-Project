require('sinatra')
require('sinatra/reloader') if development?
# require('pry')
require_relative('../models/account')
require_relative('../models/merchant')
require_relative('../models/transaction')
require_relative('../models/tag')
also_reload('../models/*')

get '/account' do
  @accounts = Account.all
  erb(:"accounts/index")
end

# binding.pry
# nil
