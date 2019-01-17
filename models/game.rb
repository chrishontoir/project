require_relative('../db/sql_runner.rb')
require_relative('../models/card.rb')
require_relative('../models/deck.rb')
require_relative('../models/player.rb')

class Game

  attr_reader :id
  attr_accessor :date, :player1_id, :player1_health, :player1_power, :player1_deck, :player1_hand, :player1_played, :player2_id, :player2_health, :player2_power, :player2_deck, :player2_hand, :player2_played, :status

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @date = options['date']
    @player1_id = options['player1_id'].to_i
    @player1_health = options['player1_health'].to_i
    @player1_power = options['player1_power'].to_i
    @player1_deck = options['player1_deck'].to_i
    @player1_hand = options['player1_hand']
    @player1_played = options['player1_played']

    @player2_id = options['player2_id'].to_i
    @player2_health = options['player2_health'].to_i
    @player2_power = options['player2_power'].to_i
    @player2_deck = options['player2_deck'].to_i
    @player2_hand = options['player2_hand']
    @player2_played = options['player2_played']

    @status = options['status']

  end

  def save()
    sql = "INSERT INTO games (date, player1_id, player1_health, player1_power, player1_deck, player1_hand, player1_played, player2_id, player2_health, player2_power, player2_deck, player2_hand, player2_played, status) VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14) RETURNING id"
    values = [@date, @player1_id, @player1_health, @player1_power, @player1_deck, @player1_hand, @player1_played, @player2_id, @player2_health, @player2_power, @player2_deck, @player2_hand, @player2_played, @status]
    game = SqlRunner.run(sql, values).first
    @id = game['id'].to_i
  end


end