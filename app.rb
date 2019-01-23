require('sinatra')
require('sinatra/reloader') if development?
# require('pry')
require_relative('controllers/accounts_controller')
require_relative('controllers/tags_controller')
require_relative('controllers/merchants_controller')
require_relative('controllers/transactions_controller')

get '/' do
  erb(:home)
end

# binding.pry
# nil
