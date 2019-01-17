require('sinatra')
require('sinatra/reloader') if development?
require_relative('../models/player.rb')
require_relative('../models/deck.rb')
require_relative('../models/card.rb')
also_reload('../models/*')

get '/cards' do
  @cards = Card.all()
  erb(:"cards/index")
end

get '/cards/:id' do
  @card = Card.find(params['id'].to_i)
  erb(:"cards/show")
end
