require_relative('../db/sql_runner')
require_relative('../models/game.rb')

class Player

  attr_reader :id
  attr_accessor :name, :avatar, :admin

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name'].capitalize()
    @avatar = options['avatar']
    @admin = options['admin']
  end

  def save()
    sql = "INSERT INTO players (name, avatar, admin) VALUES ($1, $2, $3) RETURNING id"
    values = [@name, @avatar, @admin]
    player = SqlRunner.run(sql, values).first
    @id = player['id'].to_i
  end

  def update()
    sql = "UPDATE players SET (name, avatar, admin) = ($1, $2, $3) WHERE id = $4"
    values = [@name, @avatar, @admin, @id]
    SqlRunner.run(sql,values)
  end

  def self.all()
    sql = "SELECT * FROM players ORDER BY id ASC"
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

  def games
    sql = "SELECT * FROM games WHERE games.player1_id = $1 OR games.player2_id = $1"
    values = [@id]
    results = SqlRunner.run(sql, values)
    return results.map { |game| Game.new(game)}
  end

  def full_decks
    all_decks = decks()
    full_decks_array = []
    for deck in all_decks
      if deck.card_count == 10
        full_decks_array.push(deck)
      end
    end
    return full_decks_array
  end

  def full_decks_count()
    full_decks.count()
  end

  def self.no_of_players_full_deck
    players = Player.all()
    number = 0
    for player in players
      if player.full_decks_count > 0
        number += 1
      end
    end
    return number
  end

  def delete
    sql = "DELETE FROM players WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql,values)
  end

end
