require('sinatra')
require('sinatra/reloader') if development?
require_relative('../models/player.rb')
require_relative('../models/deck.rb')
require_relative('../models/card_deck.rb')
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
  player.name.capitalize()

  if player.avatar == ""
    player.avatar = "/images/user.png"
  end
  player.save
  deck = Deck.new({"name" => "Default Deck", "player_id" => player.id}).save()
  card_deck1 = Card_Deck.new({"card_id" => 1, "deck_id" => "#{deck}", "in_hand" => 0, "played" => 0, "order_num" => rand(10000)}).save()
  card_deck2 = Card_Deck.new({"card_id" => 4, "deck_id" => "#{deck}", "in_hand" => 0, "played" => 0, "order_num" => rand(10000)}).save()
  card_deck3 = Card_Deck.new({"card_id" => 5, "deck_id" => "#{deck}", "in_hand" => 0, "played" => 0, "order_num" => rand(10000)}).save()
  card_deck4 = Card_Deck.new({"card_id" => 8, "deck_id" => "#{deck}", "in_hand" => 0, "played" => 0, "order_num" => rand(10000)}).save()
  card_deck5 = Card_Deck.new({"card_id" => 10, "deck_id" => "#{deck}", "in_hand" => 0, "played" => 0, "order_num" => rand(10000)}).save()
  card_deck6 = Card_Deck.new({"card_id" => 14, "deck_id" => "#{deck}", "in_hand" => 0, "played" => 0, "order_num" => rand(10000)}).save()
  card_deck7 = Card_Deck.new({"card_id" => 17, "deck_id" => "#{deck}", "in_hand" => 0, "played" => 0, "order_num" => rand(10000)}).save()
  card_deck8 = Card_Deck.new({"card_id" => 19, "deck_id" => "#{deck}", "in_hand" => 0, "played" => 0, "order_num" => rand(10000)}).save()
  card_deck9 = Card_Deck.new({"card_id" => 22, "deck_id" => "#{deck}", "in_hand" => 0, "played" => 0, "order_num" => rand(10000)}).save()
  card_deck10 = Card_Deck.new({"card_id" => 24, "deck_id" => "#{deck}", "in_hand" => 0, "played" => 0, "order_num" => rand(10000)}).save()
  redirect to("/players")
end

get '/players/:id' do
  @player = Player.find(params['id'].to_i)
  erb(:"players/show")
end

post '/players/:id' do
  deck = Deck.new(params)
  deck.save
  redirect to("/decks/#{deck.id}")
end

get '/players/:id/delete' do
  @player = Player.find(params['id'].to_i)
  @player.delete
  redirect to("/players")
end
