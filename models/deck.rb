require_relative('../db/sql_runner.rb')
require_relative('../models/card.rb')
require_relative('../models/card_deck.rb')

class Deck

  attr_reader :id
  attr_accessor :name, :player_id

  def initialize(options)
    @id = options['id'].to_i if options ['id']
    @name = options['name']
    @player_id = options['player_id'].to_i
  end

  def save()
    sql = "INSERT INTO decks (name, player_id) VALUES ($1, $2) RETURNING id"
    values = [@name, @player_id]
    player = SqlRunner.run(sql, values).first
    @id = player['id'].to_i
  end

  def cards()
    sql = "SELECT cards.* FROM cards INNER JOIN cards_decks ON cards.id = cards_decks.card_id WHERE cards_decks.deck_id = $1 ORDER BY cards_decks.id ASC"
    values = [@id]
    cards = SqlRunner.run(sql, values)
    return cards.map {|card| Card.new(card)}
  end

  def cards_in_hand()
    sql = "SELECT cards.* FROM cards INNER JOIN cards_decks ON cards.id = cards_decks.card_id WHERE cards_decks.deck_id = $1 AND cards_decks.in_hand = TRUE ORDER BY cards_decks.id ASC"
    values = [@id]
    cards = SqlRunner.run(sql, values)
    return cards.map {|card| Card.new(card)}
  end

  def cards_not_in_hand()
    sql = "SELECT cards_decks.* FROM cards INNER JOIN cards_decks ON cards.id = cards_decks.card_id WHERE cards_decks.deck_id = $1 AND cards_decks.in_hand = FALSE ORDER BY cards_decks.order_num ASC"
    values = [@id]
    cards = SqlRunner.run(sql, values)
    return cards.map {|card| Card_Deck.new(card)}
  end

  def cards_played()
    sql = "SELECT cards.* FROM cards INNER JOIN cards_decks ON cards.id = cards_decks.card_id WHERE cards_decks.deck_id = $1 AND cards_decks.played = TRUE ORDER BY cards_decks.id ASC"
    values = [@id]
    cards = SqlRunner.run(sql, values)
    return cards.map {|card| Card.new(card)}
  end

  def card_count()
    return cards.count
  end

  def cards_in_hand_count()
    return cards_in_hand.count
  end

  def cards_not_in_hand_count()
    return cards_not_in_hand.count
  end

  def cards_played_count()
    return cards_played.count
  end

  def self.all()
    sql = "SELECT * FROM decks"
    decks = SqlRunner.run(sql)
    return decks.map {|deck| Deck.new(deck)}
  end

  def self.find(id)
    sql = "SELECT * FROM decks WHERE id = $1"
    values = [id]
    deck = SqlRunner.run(sql, values).first
    return Deck.new(deck)
  end

  def card_name(id)
    sql = "SELECT cards.name FROM cards WHERE id = $1"
    values = [id]
    card = SqlRunner.run(sql, values).first
    return card['name']
  end

  def convert_card1_to_id
    sql = "SELECT cards.id FROM cards WHERE cards.name = $1"
    values = [@card_1]
    card_id = SqlRunner.run(sql, values).first
    @card_1 = card_id
  end

  def check_hand
    while cards_in_hand_count < 5
      cards_not_in_hand[0].change_hand()
      cards_not_in_hand[0].update()
    end
  end


end
