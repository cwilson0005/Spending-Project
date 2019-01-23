require('sinatra')
require('sinatra/reloader') if development?
# require('pry')
require_relative('controllers/account_controller')
require_relative('controllers/tag_controller')
require_relative('controllers/merchant_controller')
require_relative('controllers/transaction_controller')

get '/' do
  erb(:home)
end

get '/account/transactions/:id/edit' do
  @transaction = Transaction.find(params['id'])
  @merchants = Merchant.all
  @tags = Tag.all
  erb(:edit)
end

post '/account/transactions/:id' do
  transaction = Transaction.new(params)
  transaction.update
  redirect to "/account/transactions/#{params['id']}"
end

# binding.pry
# nil
