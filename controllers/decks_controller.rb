require('sinatra')
require('sinatra/reloader') if development?
require_relative('../models/player.rb')
require_relative('../models/deck.rb')
require_relative('../models/card.rb')
also_reload('../models/*')

get '/decks' do
  @decks = Deck.all()
  erb(:"decks/index")
end

get '/decks/new/:id' do
  @decks = Deck.all()
  @player = Player.find(params['id'].to_i)
  @cards = Card.all()
  erb(:"decks/new")
end

post '/decks' do
  deck = Deck.new(params)
  deck.save
  redirect to("/players")
end

get '/decks/:id' do
  @deck = Deck.find(params['id'].to_i)
  @cards = Card.all()
  erb(:"decks/show")
end
