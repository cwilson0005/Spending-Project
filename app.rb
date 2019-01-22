require('sinatra')
require('sinatra/reloader') if development?
# require('pry')
require_relative( 'controller/spending_controller.rb' )

get '/' do
  erb(:home)
end

# binding.pry
# nil
