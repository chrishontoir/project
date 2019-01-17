require_relative('../db/sql_runner.rb')

class Deck

  attr_reader :id
  attr_accessor :name, :card_array, :player_id

  def initialize(options)
    @id = options['id'].to_i if options ['id']
    @name = options['name']
    @card_array = options['card_array']
    @player_id = options['player_id'].to_i
  end

  def save()
    sql = "INSERT INTO decks (name, card_array, player_id) VALUES ($1, $2, $3) RETURNING id"
    values = [@name, @card_array, @player_id]
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


end
