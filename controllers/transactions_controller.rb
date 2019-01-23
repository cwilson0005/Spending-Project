require('sinatra')
require('sinatra/reloader') if development?
# require('pry')
require_relative('../models/account.rb')
require_relative('../models/merchant.rb')
require_relative('../models/transaction.rb')
require_relative('../models/tag.rb')
also_reload('../models/*')
require('pry')

get '/transactions' do
  @transactions = Transaction.all
  @merchants = Merchant.all
  @tags = Tag.all
  erb(:"transactions/index")
end

get '/transactions/new' do
  @merchants = Merchant.all
  @tags = Tag.all
  erb(:"transactions/new")
end

get '/transactions/:id' do
  @transaction = Transaction.find(params['id'])
  erb(:"transactions/show")
end

get '/transactions/:id/edit' do
  @transaction = Transaction.find(params['id'])
  @merchants = Merchant.all
  @tags = Tag.all
  erb(:"transactions/edit")
end

post '/transactions' do
  Transaction.new(params).save
  # binding.pry
  redirect to '/transactions'
end

post '/transactions/:id/delete' do
  transaction = Transaction.find(params['id'])
  transaction.delete
  redirect to '/transactions'
end

post '/transactions/:id' do
  transaction = Transaction.new(params)
  transaction.update
  redirect to "/transactions/#{params['id']}"
end
