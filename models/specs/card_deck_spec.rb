require('minitest/autorun')
require('minitest/rg')
require_relative('../card_deck.rb')

class Card_DeckTest < Minitest::Test

  def setup
    options = {"card_id" => 14, "deck_id" => 3, "in_hand" => 1, "played" => 0, "order_num" => 8465}
    @card_deck = Card_Deck.new(options)
  end

  def test_card_deck_has_card_id
    assert_equal(14, @card_deck.card_id)
  end

  def test_card_deck_has_deck_id
    assert_equal(3, @card_deck.deck_id)
  end

  def test_card_deck_has_in_hand_check
    assert_equal(1 , @card_deck.in_hand)
  end

  def test_card_deck_has_played_check
    assert_equal(0 , @card_deck.played)
  end

  def test_card_deck_has_order_num
    assert_equal(8465 , @card_deck.order_num)
  end

end
