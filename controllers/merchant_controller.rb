require('sinatra')
require('sinatra/reloader') if development?
# require('pry')
require_relative( '../models/merchant.rb' )
also_reload( '../models/*' )

get '/merchants' do
  @merchants = Merchant.all
  erb(:"merchants/index")
end

get '/merchants/new' do
  erb(:"merchants/new")
end

get '/merchants/:id' do
  @merchant = Merchant.find(params['id'])
  erb(:"merchants/show")
end

post '/merchants' do
  Merchant.new(params).save
  redirect to '/merchants'
end

post '/merchants/:id/delete' do
  merchant = Merchant.find(params['id'])
  merchant.delete
  redirect to '/merchants'
end
