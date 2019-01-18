require_relative('../models/player.rb')
require_relative('../models/deck.rb')
require_relative('../models/card.rb')
require_relative('../models/game.rb')
require_relative('../models/card_deck.rb')
require('pry')
require('date')

player1 = Player.new({
  "name" => "Chris",
  "deck_array" => "[]",
  "games" => "[]"
})
player1.save()

player2 = Player.new({
  "name" => "Jennifer",
  "deck_array" => "[]",
  "games" => "[]"
})
player2.save()

player3 = Player.new({
  "name" => "James",
  "deck_array" => "[]",
  "games" => "[]"
})
player3.save()


card1 = Card.new({
  "name" => "Spear Throw",
  "description" => "Deal moderate damage",
  "damage" => 4,
  "healing" => 0,
  "cost" => 3
})
card1.save()

card2 = Card.new({
  "name" => "Lightning Bolt",
  "description" => "Strong magic attack",
  "damage" => 6,
  "healing" => 0,
  "cost" => 5
})
card2.save()

deck1 = Deck.new({
  "name" => "Default Deck",
  "player_id" => player1.id
})
deck1.save()

deck2 = Deck.new({
  "name" => "Magic Focused Deck",
  "player_id" => player1.id
})
deck2.save()

deck3 = Deck.new({
  "name" => "Spear Focused Deck",
  "player_id" => player3.id
})
deck3.save()

card_deck1 = Card_Deck.new({
  "card_id" => card1.id,
  "deck_id" => deck1.id,
  "in_hand" => 0,
  "played" => 0,
  "order_num" => rand(10000)
})
card_deck1.save()

card_deck2 = Card_Deck.new({
  "card_id" => card1.id,
  "deck_id" => deck1.id,
  "in_hand" => 1,
  "played" => 0,
  "order_num" => rand(10000)
})
card_deck2.save()

card_deck3 = Card_Deck.new({
  "card_id" => card1.id,
  "deck_id" => deck1.id,
  "in_hand" => 0,
  "played" => 0,
  "order_num" => rand(10000)
})
card_deck3.save()

card_deck4 = Card_Deck.new({
  "card_id" => card1.id,
  "deck_id" => deck1.id,
  "in_hand" => 1,
  "played" => 0,
  "order_num" => rand(10000)
})
card_deck4.save()

card_deck5 = Card_Deck.new({
  "card_id" => card1.id,
  "deck_id" => deck1.id,
  "in_hand" => 0,
  "played" => 0,
  "order_num" => rand(10000)
})
card_deck5.save()

card_deck6 = Card_Deck.new({
  "card_id" => card1.id,
  "deck_id" => deck2.id,
  "in_hand" => 0,
  "played" => 0,
  "order_num" => rand(10000)
})
card_deck6.save()

card_deck7 = Card_Deck.new({
  "card_id" => card1.id,
  "deck_id" => deck2.id,
  "in_hand" => 0,
  "played" => 0,
  "order_num" => rand(10000)
})
card_deck7.save()

card_deck8 = Card_Deck.new({
  "card_id" => card1.id,
  "deck_id" => deck2.id,
  "in_hand" => 0,
  "played" => 0,
  "order_num" => rand(10000)
})
card_deck8.save()

card_deck9 = Card_Deck.new({
  "card_id" => card1.id,
  "deck_id" => deck3.id,
  "in_hand" => 0,
  "played" => 0,
  "order_num" => rand(10000)
})
card_deck9.save()

card_deck10 = Card_Deck.new({
  "card_id" => card1.id,
  "deck_id" => deck3.id,
  "in_hand" => 0,
  "played" => 0,
  "order_num" => rand(10000)
})
card_deck10.save()

d = DateTime.now
datetime = d.strftime("%d/%m/%Y %H:%M")

game1 = Game.new({
  "date" => "10/01/2019 10:54",
  "player1_id" => player1.id,
  "player1_health" => 30,
  "player1_power" => 1,
  "player1_deck" => 2,
  "player1_hand" => [],
  "player1_played" => [],
  "player2_id" => player2.id,
  "player2_health" => 30,
  "player2_power" => 1,
  "player2_deck" => 2,
  "player2_hand" => [],
  "player2_played" => [],
  "status" => player1.id
})
game1.save()

game2 = Game.new({
  "date" => "14/01/2019 16:32",
  "player1_id" => player2.id,
  "player1_health" => 30,
  "player1_power" => 1,
  "player1_deck" => 2,
  "player1_hand" => [],
  "player1_played" => [],
  "player2_id" => player1.id,
  "player2_health" => 30,
  "player2_power" => 1,
  "player2_deck" => 2,
  "player2_hand" => [],
  "player2_played" => [],
  "status" => player2.id
})
game2.save()

game3 = Game.new({
  "date" => datetime,
  "player1_id" => player3.id,
  "player1_health" => 30,
  "player1_power" => 1,
  "player1_deck" => 2,
  "player1_hand" => [],
  "player1_played" => [],
  "player2_id" => player2.id,
  "player2_health" => 30,
  "player2_power" => 1,
  "player2_deck" => 2,
  "player2_hand" => [],
  "player2_played" => [],
  "status" => player2.id
})
game3.save()

binding.pry
nil
