require('sinatra')
require('sinatra/reloader') if development?
require_relative('../models/player.rb')
require_relative('../models/deck.rb')
require_relative('../models/deck.rb')
require_relative('../models/game.rb')
also_reload('../models/*')

require('date')

@d = DateTime.now
@datetime = @d.strftime("%d/%m/%Y %H:%M")

get '/games/new' do
  @players = Player.all()
  @decks = Deck.all()
  erb(:"games/new")
end

post '/games' do
  game = Game.new(params)
  game.date = "#{DateTime.now.strftime("%d/%m/%Y %H:%M")}"
  game.save
  redirect to("/games/#{game.id}/decks")
end

get '/games/:id/decks' do
  @game = Game.find(params['id'].to_i)
  @player1 = Player.find(@game.player1_id)
  @player2 = Player.find(@game.player2_id)
  erb(:"games/show")
end

put '/games/:id' do
  # Game.new(params).update
  @editted_game = Game.find(params[:id])

  @editted_game.date = params[:date]
  @editted_game.player1_health = params[:player1_health]
  @editted_game.player1_power = params[:player1_power]
  @editted_game.player1_deck = params[:player1_deck]
  @editted_game.player1_hand = params[:player1_hand]
  @editted_game.player1_played = params[:player1_played]

  @editted_game.player2_health = params[:player2_health]
  @editted_game.player2_power = params[:player2_power]
  @editted_game.player2_deck = params[:player2_deck]
  @editted_game.player2_hand = params[:player2_hand]
  @editted_game.player2_played = params[:player2_played]

  @editted_game.status = params[:status]

  @editted_game.update()
  redirect to("/games/#{params[:id]}")
end

get '/games/:id' do
  @game = Game.find(params['id'].to_i)
  @player1 = Player.find(@game.player1_id)
  @player2 = Player.find(@game.player2_id)
  @player1_deck = Deck.find(@game.player1_deck)
  @player2_deck = Deck.find(@game.player2_deck)
  erb(:"games/play")
end
