require('sinatra')
require('sinatra/reloader') if development?
require_relative('../models/player.rb')
require_relative('../models/deck.rb')
require_relative('../models/deck.rb')
require_relative('../models/game.rb')
require_relative('../models/card_deck.rb')
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
  @editted_game.player1_health = 30
  @editted_game.player1_power = params[:player1_power]
  @editted_game.player1_deck = params[:player1_deck]
  @editted_game.player1_hand = params[:player1_hand].to_i
  @editted_game.player1_played = params[:player1_played]

  @editted_game.player2_health = 30
  @editted_game.player2_power = params[:player2_power]
  @editted_game.player2_deck = params[:player2_deck]
  @editted_game.player2_hand = params[:player2_hand].to_i
  @editted_game.player2_played = params[:player2_played]

  @editted_game.status = params[:status]

  if @editted_game.player1_played != "0"
    p1_card = Card_Deck.find(@editted_game.player1_played)
    p1_card.play_card()
  end
  if @editted_game.player2_played != "0"
    p2_card = Card_Deck.find(@editted_game.player2_played)
    p2_card.play_card()
  end

  @editted_game.update()
  redirect to("/games/#{params[:id]}")
end

get '/games/:id' do
  @game = Game.find(params['id'].to_i)

  @game.increase_status()
  @game.increase_power()

  @game.player1_played = 0
  @game.player2_played = 0

  @player1 = Player.find(@game.player1_id)
  @player2 = Player.find(@game.player2_id)
  @player1_deck = Deck.find(@game.player1_deck)
  @player2_deck = Deck.find(@game.player2_deck)
  @game.player1_health -= @player2_deck.cards_played_damage()
  @game.player2_health -= @player1_deck.cards_played_damage()
  @player1_deck.check_hand()
  @player2_deck.check_hand()
  @player1_hand = @player1_deck.cards_in_hand()
  @player2_hand = @player2_deck.cards_in_hand()
  erb(:"games/play")
end
