require_relative('../models/player.rb')
require_relative('../models/deck.rb')
require_relative('../models/card.rb')
require_relative('../models/game.rb')
require_relative('../models/card_deck.rb')
require('pry')
require('date')

player1 = Player.new({
  "name" => "Chris",
  "avatar" => "/images/spectral_bear.png",
  "admin" => 1
})
player1.save()

player2 = Player.new({
  "name" => "Bob",
  "avatar" => "/images/runic_chant.png",
  "admin" => 0
})
player2.save()

player3 = Player.new({
  "name" => "Bill",
  "avatar" => "/images/user.png",
  "admin" => "0"
})
player3.save()


card1 = Card.new({"name" => "Fireball","description" => "Weak spell damage","damage" => 1,"healing" => 0,"cost" => 0,"image" => "/images/fireball.png"})
card1.save()
card2 = Card.new({"name" => "Arcane Strike","description" => "Weak spell damage","damage" => 1,"healing" => 0,"cost" => 0,"image" => "/images/arcane_strike.png"})
card2.save()
card3 = Card.new({"name" => "Boulder","description" => "Weak physical damage","damage" => 2,"healing" => 0,"cost" => 1,"image" => "/images/boulder.png"})
card3.save()
card4 = Card.new({"name" => "Animal Trap","description" => "Weak physical damage","damage" => 2,"healing" => 0,"cost" => 1,"image" => "/images/animal_trap.png"})
card4.save()
card5 = Card.new({"name" => "Ice Shards","description" => "Moderate spell damage","damage" => 3,"healing" => 0,"cost" => 2,"image" => "/images/ice_shards.png"})
card5.save()
card6 = Card.new({"name" => "Thorns","description" => "Moderate spell damage","damage" => 3,"healing" => 0,"cost" => 2,"image" => "/images/thorns.png"})
card6.save()
card7 = Card.new({"name" => "Poisoned Dagger","description" => "Physical damage & heal","damage" => 3,"healing" => 1,"cost" => 3,"image" => "/images/poisoned_dagger.png"})
card7.save()
card8 = Card.new({"name" => "Lightning Strike","description" => "Moderate spell damage","damage" => 4,"healing" => 0,"cost" => 3,"image" => "/images/lightning_strike.png"})
card8.save()
card9 = Card.new({"name" => "Spectral Bear","description" => "Moderate damage pet","damage" => 4,"healing" => 0,"cost" => 3,"image" => "/images/spectral_bear.png"})
card9.save()
card10 = Card.new({"name" => "Soul Siphon","description" => "Moderate damage & heal","damage" => 3,"healing" => 2,"cost" => 4,"image" => "/images/soul_siphon.png"})
card10.save()
card11 = Card.new({"name" => "Acidic Arrows","description" => "High poison damage","damage" => 5,"healing" => 0,"cost" => 4,"image" => "/images/acidic_arrows.png"})
card11.save()
card12 = Card.new({"name" => "Lunar Daze","description" => "Moderate damage & heal","damage" => 4,"healing" => 1,"cost" => 4,"image" => "/images/lunar_daze.png"})
card12.save()
card13 = Card.new({"name" => "Arcane Bomb","description" => "High spell damage","damage" => 6,"healing" => 0,"cost" => 5,"image" => "/images/arcane_bomb.png"})
card13.save()
card14 = Card.new({"name" => "Summon Demon","description" => "High damage & heal","damage" => 5,"healing" => 1,"cost" => 5,"image" => "/images/summon_demon.png"})
card14.save()
card15 = Card.new({"name" => "Spear Attack","description" => "High physical damage","damage" => 6,"healing" => 0,"cost" => 5,"image" => "/images/spear_attack.png"})
card15.save()
card16 = Card.new({"name" => "Comet","description" => "Extreme spell damage","damage" => 7,"healing" => 0,"cost" => 6,"image" => "/images/comet.png"})
card16.save()
card17 = Card.new({"name" => "Hurricane","description" => "High damage & heal","damage" => 5,"healing" => 2,"cost" => 6,"image" => "/images/hurricane.png"})
card17.save()

card18 = Card.new({"name" => "Bandage","description" => "Very weak heal","damage" => 0,"healing" => 1,"cost" => 0,"image" => "/images/bandage.png"})
card18.save()
card19 = Card.new({"name" => "Fortify","description" => "Weak heal","damage" => 0,"healing" => 2,"cost" => 1,"image" => "/images/fortify.png"})
card19.save()
card20 = Card.new({"name" => "Herbal Remedy","description" => "Moderate heal","damage" => 0,"healing" => 3,"cost" => 2,"image" => "/images/herbal_remedy.png"})
card20.save()
card21 = Card.new({"name" => "Holy Light","description" => "Moderate heal","damage" => 0,"healing" => 3,"cost" => 2,"image" => "/images/holy_light.png"})
card21.save()
card22 = Card.new({"name" => "Healing Mist","description" => "Strong heal","damage" => 0,"healing" => 4,"cost" => 3,"image" => "/images/healing_mist.png"})
card22.save()
card23 = Card.new({"name" => "Runic Chant","description" => "Moderate heal & damage","damage" => 2,"healing" => 3,"cost" => 4,"image" => "/images/runic_chant.png"})
card23.save()
card24 = Card.new({"name" => "Inspiration","description" => "Strong heal","damage" => 0,"healing" => 5,"cost" => 5,"image" => "/images/inspiration.png"})
card24.save()


deck1 = Deck.new({
  "name" => "Random Deck",
  "player_id" => player1.id
})
deck1.save()

deck2 = Deck.new({
  "name" => "Magic Deck",
  "player_id" => player1.id
})
deck2.save()

deck3 = Deck.new({
  "name" => "Heal Focused Deck",
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
  "player1_hand" => "",
  "player1_played" => "",
  "player2_id" => player2.id,
  "player2_health" => 30,
  "player2_power" => 1,
  "player2_deck" => 2,
  "player2_hand" => "",
  "player2_played" => "",
  "status" => player1.id
})
game1.save()

game2 = Game.new({
  "date" => "14/01/2019 16:32",
  "player1_id" => player2.id,
  "player1_health" => 30,
  "player1_power" => 1,
  "player1_deck" => 2,
  "player1_hand" => "",
  "player1_played" => "",
  "player2_id" => player1.id,
  "player2_health" => 30,
  "player2_power" => 1,
  "player2_deck" => 2,
  "player2_hand" => "",
  "player2_played" => "",
  "status" => player2.id
})
game2.save()

game3 = Game.new({
  "date" => datetime,
  "player1_id" => player3.id,
  "player1_health" => 30,
  "player1_power" => 1,
  "player1_deck" => 2,
  "player1_hand" => "",
  "player1_played" => "",
  "player2_id" => player2.id,
  "player2_health" => 30,
  "player2_power" => 1,
  "player2_deck" => 2,
  "player2_hand" => "",
  "player2_played" => "",
  "status" => player2.id
})
game3.save()

binding.pry
nil
