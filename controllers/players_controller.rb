require('sinatra')
require('sinatra/reloader') if development?
require_relative('../models/player.rb')
require_relative('../models/deck.rb')
also_reload('../models/*')

get '/players' do
  @players = Player.all()
  erb(:"players/index")
end

get '/players/new' do
  @players = Player.all
  erb(:"players/new")
end

post '/players' do
  player = Player.new(params)
  player.save
  redirect to("/players")
end

get '/players/:id' do
  @player = Player.find(params['id'].to_i)
  erb(:"players/show")
end

post '/players/:id' do
  deck = Deck.new(params)
  deck.save
  redirect to("/players/#{params[:id]}")
end
