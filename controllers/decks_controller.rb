require('sinatra')
require('sinatra/reloader') if development?
require_relative('../models/player.rb')
require_relative('../models/deck.rb')
also_reload('../models/*')

get '/decks' do
  @decks = Deck.all()
  erb(:"decks/index")
end

get '/decks/:id' do
  @deck = Deck.find(params['id'].to_i)
  erb(:"decks/show")
end
