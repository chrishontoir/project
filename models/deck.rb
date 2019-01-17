require_relative('../db/sql_runner.rb')
require_relative('../models/card.rb')

class Deck

  attr_reader :id
  attr_accessor :name, :player_id, :card_1, :card_2, :card_3, :card_4, :card_5, :card_6, :card_7, :card_8, :card_9, :card_10

  def initialize(options)
    @id = options['id'].to_i if options ['id']
    @name = options['name']
    @player_id = options['player_id'].to_i
    @card_1 = options['card_1'].to_i
    @card_2 = options['card_2'].to_i
    @card_3 = options['card_3'].to_i
    @card_4 = options['card_4'].to_i
    @card_5 = options['card_5'].to_i
    @card_6 = options['card_6'].to_i
    @card_7 = options['card_7'].to_i
    @card_8 = options['card_8'].to_i
    @card_9 = options['card_9'].to_i
    @card_10 = options['card_10'].to_i
  end

  def save()
    sql = "INSERT INTO decks (name, player_id, card_1, card_2, card_3, card_4, card_5, card_6, card_7, card_8, card_9, card_10) VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12) RETURNING id"
    values = [@name, @player_id, @card_1, @card_2, @card_3, @card_4, @card_5, @card_6, @card_7, @card_8, @card_9, @card_10]
    player = SqlRunner.run(sql, values).first
    @id = player['id'].to_i
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


end
