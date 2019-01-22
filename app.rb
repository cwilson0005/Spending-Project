require('sinatra')
require('sinatra/reloader') if development?
# require('pry')
# require_relative('controller/spending_controller.rb')
require_relative('models/account.rb')
require_relative('models/merchant.rb')
require_relative('models/transaction.rb')
require_relative('models/tag.rb')
also_reload('models/*')

get '/' do
  erb(:home)
end

get '/account' do
  @accounts = Account.all
  erb(:index)
end

get '/account/transactions' do
  @transactions = Transaction.all
  erb(:transactions)
end

get '/account/transactions/new' do
  @merchants = Merchant.all
  @tags = Tag.all
  erb(:new)
end

post '/account/transactions' do
  Transaction.new(params).save
  redirect to '/account/transactions'
end

get '/account/transactions/:id' do
  @transaction = Transaction.find(params['id'])
  erb(:show)
end

post '/account/transactions/:id/delete' do
  transaction = Transaction.find(params['id'])
  transaction.delete
  redirect to '/account/transactions'
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
