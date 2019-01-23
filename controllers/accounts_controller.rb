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

# get '/account/:id' do
#   @account = Account.find(params['id'])
#   erb(:"account/show")
# end
#
# get '/account/:id/edit' do
#   @account = Account.find(params['id'])
#   erb(:"accounts/edit")
# end
#
# post '/account' do
#   account = Account.new(params)
#   account.update
#   redirect to "/account"
# end

# binding.pry
# nil
