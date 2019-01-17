require_relative('../db/sql_runner')

class Player

  attr_reader :id
  attr_accessor :name, :deck_array, :games

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @deck_array = options['deck_array']
    @games = options['games']
  end

  def save()
    sql = "INSERT INTO players (name, deck_array, games) VALUES ($1, $2, $3) RETURNING id"
    values = [@name, @deck_array, @games]
    player = SqlRunner.run(sql, values).first
    @id = player['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM players"
    players = SqlRunner.run(sql)
    return players.map {|player| Player.new(player)}
  end

  def self.find(id)
    sql = "SELECT * FROM players WHERE id = $1"
    values = [id]
    player = SqlRunner.run(sql, values).first
    return Player.new(player)
  end

  def decks
    sql = "SELECT * FROM decks WHERE decks.player_id = $1"
    values = [@id]
    results = SqlRunner.run(sql, values)
    return results.map { |deck| Deck.new(deck) }
  end


end
