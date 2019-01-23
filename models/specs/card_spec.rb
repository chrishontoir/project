require('minitest/autorun')
require('minitest/rg')
require_relative('../card.rb')

class CardTest < Minitest::Test

  def setup
    options = {"name" => "Fireball", "description" => "Low spell damage", "damage" => 1, "healing" => 0, "cost" => 1, "image" => "/images/fireball.png"}
    @card = Card.new(options)
  end

  def test_card_has_name
    assert_equal("Fireball", @card.name)
  end

  def test_card_has_description
    assert_equal("Low spell damage", @card.description)
  end

  def test_card_has_damage
    assert_equal(1, @card.damage)
  end

  def test_card_has_healing
    assert_equal(0, @card.healing)
  end

  def test_card_has_cost
    assert_equal(1, @card.cost)
  end

  def test_card_has_image
    assert_equal("/images/fireball.png", @card.image)
  end

end
