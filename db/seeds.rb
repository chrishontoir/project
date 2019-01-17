require_relative('../models/player.rb')
require_relative('../models/deck.rb')
require('pry')

player1 = Player.new({
  "name" => "Chris",
  "deck_array" => "[]",
  "games" => "[]"
})

player1.save()

deck1 = Deck.new({
  "name" => "Default Deck",
  "card_array" => "[]",
  "player_id" => player1.id
})

deck2 = Deck.new({
  "name" => "Magic Deck",
  "card_array" => "[]",
  "player_id" => player1.id
})

deck1.save()
deck2.save()

binding.pry
nil
