require_relative('../db/sql_runner.rb')

class Card

  attr_reader :id
  attr_accessor :name, :description, :damage, :healing, :cost, :image

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @description = options['description']
    @damage = options['damage'].to_i
    @healing = options['healing'].to_i
    @cost = options['cost'].to_i
    @image = options['image']
  end

  def save()
    sql = "INSERT INTO cards (name, description, damage, healing, cost, image) VALUES ($1, $2, $3, $4, $5, $6) RETURNING id"
    values = [@name, @description, @damage, @healing, @cost, @image]
    card = SqlRunner.run(sql, values).first
    @id = card['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM cards"
    cards = SqlRunner.run(sql)
    return cards.map {|card| Card.new(card)}
  end

  def self.find(id)
    sql = "SELECT * FROM cards WHERE id = $1"
    values = [id]
    card = SqlRunner.run(sql, values).first
    return Card.new(card)
  end

  def self.find_by_name(name)
    sql = "SELECT id FROM cards WHERE name = $1"
    values = [name]
    card = SqlRunner.run(sql, values).first
    return card['id']
  end


end
