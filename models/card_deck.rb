require_relative('../db/sql_runner.rb')
require_relative('../models/card.rb')
require_relative('../models/deck.rb')
require_relative('../models/player.rb')
require_relative('../models/game.rb')

class Card_Deck

  attr_reader :id
  attr_accessor :card_id, :deck_id, :in_hand, :played

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @card_id = options['card_id'].to_i
    @deck_id = options['deck_id'].to_i
    @in_hand = options['in_hand']
    @played = options['played']
  end

  def save()
    sql = "INSERT INTO cards_decks (card_id, deck_id, in_hand, played) VALUES ($1, $2, $3, $4) RETURNING id"
    values = [@card_id, @deck_id, @in_hand, @played]
    card_deck = SqlRunner.run(sql, values).first
    @id = card_deck['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM cards_decks"
    card_decks = SqlRunner.run(sql)
    return card_decks.map {|card_deck| Card_Deck.new(card_deck)}
  end

  def update()
    sql = "UPDATE cards_decks SET (card_id, deck_id, in_hand, played) = ($1, $2, $3, $4) WHERE id = $5"
    values = [@card_id, @deck_id, @in_hand, @played, @id]
    SqlRunner.run(sql, values)
  end

  def change_hand
    if @in_hand == "f"
      @in_hand = "t"
    elsif @in_hand == "t"
      @in_hand = "f"
    end
    update()
  end


end
