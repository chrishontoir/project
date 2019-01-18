require_relative('../models/player.rb')
require_relative('../models/deck.rb')
require_relative('../models/card.rb')
require_relative('../models/game.rb')
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
  "player_id" => player1.id,
  "card_1" => card1.id,
  "card_2" => card2.id,
  "card_3" => card1.id,
  "card_4" => card2.id,
  "card_5" => card1.id,
  "card_6" => card2.id,
  "card_7" => card1.id,
  "card_8" => card2.id,
  "card_9" => card1.id,
  "card_10" => card2.id
})

deck2 = Deck.new({
  "name" => "Magic Focused Deck",
  "player_id" => player1.id,
  "card_1" => card2.id,
  "card_2" => card2.id,
  "card_3" => card2.id,
  "card_4" => card2.id,
  "card_5" => card2.id,
  "card_6" => card2.id,
  "card_7" => card2.id,
  "card_8" => card2.id,
  "card_9" => card2.id,
  "card_10" => card2.id
})

deck1.save()
deck2.save()

deck3 = Deck.new({
  "name" => "Spear Focused Deck",
  "player_id" => player3.id,
  "card_1" => card2.id,
  "card_2" => card2.id,
  "card_3" => card2.id,
  "card_4" => card2.id,
  "card_5" => card2.id,
  "card_6" => card1.id,
  "card_7" => card1.id,
  "card_8" => card1.id,
  "card_9" => card1.id,
  "card_10" => card1.id
})
deck3.save()

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

game1.player1_add_card_to_hand(card1)
game1.player1_add_card_to_hand(card2)
game1.update()

binding.pry
nil
