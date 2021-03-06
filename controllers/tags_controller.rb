require('sinatra')
require('sinatra/reloader') if development?
# require('pry')
require_relative('../models/tag.rb')
also_reload('../models/*')

get '/tags' do
  @tags = Tag.all
  erb(:"tags/index")
end

get '/tags/new' do
  erb(:"tags/new")
end

post '/tags' do
  Tag.new(params).save
  redirect to '/tags'
end
