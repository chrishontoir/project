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
  @number = Player.no_of_players_full_deck()
  @decks = Deck.all()
  erb(:"games/new")
end

post '/games' do
  game = Game.new(params)
  game.date = "#{DateTime.now.strftime("%d/%m/%Y %H:%M")}"
  game.save
  game.reset_all_cards()
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
  @editted_game.player1_health = params[:player1_health].to_i
  @editted_game.player1_power = params[:player1_power]
  @editted_game.player1_deck = params[:player1_deck]
  @editted_game.player1_hand = params[:player1_hand].to_i
  @editted_game.player1_played = params[:player1_played]

  @editted_game.player2_health = params[:player2_health].to_i
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

  @player1_deck = Deck.find(@editted_game.player1_deck)
  @player2_deck = Deck.find(@editted_game.player2_deck)

  @editted_game.player1_health = 30
  @editted_game.player2_health = 30
  @editted_game.player1_health -= @player2_deck.cards_played_damage()
  @editted_game.player2_health -= @player1_deck.cards_played_damage()
  @editted_game.player1_health += @player1_deck.cards_played_healing()
  @editted_game.player2_health += @player2_deck.cards_played_healing()

  @editted_game.update()

  if @player1_deck.cards_played_count == 10 && @player2_deck.cards_played_count == 10
    if @editted_game.player1_health > @editted_game.player2_health
      @editted_game.status = @editted_game.player1_id
      @editted_game.update()
      redirect to("/games/over/#{params[:player1_id]}")
    elsif @editted_game.player2_health > @editted_game.player1_health
      @editted_game.status = @editted_game.player2_id
      @editted_game.update()
      redirect to("/games/over/#{params[:player2_id]}")
    else
      @editted_game.status = 111111
      @editted_game.update()
      redirect to("/games/over/#{params[:player2_id]}/draw")
    end
  end

  if @editted_game.player1_health <= 0
     redirect to("/games/over/#{params[:player2_id]}")
   elsif @editted_game.player2_health <= 0
     redirect to("/games/over/#{params[:player1_id]}")
   else
    redirect to("/games/#{params[:id]}")
   end
end

get '/games/:id' do
  @game = Game.find(params['id'].to_i)

  @game.increase_status()
  @game.increase_power()

  @game.player1_played = 0
  @game.player2_played = 0
  @game.player1_health = 30
  @game.player2_health = 30

  @player1 = Player.find(@game.player1_id)
  @player2 = Player.find(@game.player2_id)
  @player1_deck = Deck.find(@game.player1_deck)
  @player2_deck = Deck.find(@game.player2_deck)
  @game.player1_health -= @player2_deck.cards_played_damage()
  @game.player2_health -= @player1_deck.cards_played_damage()
  @game.player1_health += @player1_deck.cards_played_healing()
  @game.player2_health += @player2_deck.cards_played_healing()
  @player1_deck.check_hand()
  @player2_deck.check_hand()
  @player1_hand = @player1_deck.cards_in_hand()
  @player2_hand = @player2_deck.cards_in_hand()
  erb(:"games/play")
end

get '/games/over/:id' do
  @winner = Player.find(params[:id])
  erb(:"games/over")
end
