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

# binding.pry
# nil
