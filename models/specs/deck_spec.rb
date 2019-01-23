require('minitest/autorun')
require('minitest/rg')
require_relative('../deck.rb')

class DeckTest < Minitest::Test

  def setup
    options = {"name" => "Default Deck", "player_id" => 1}
    @deck = Deck.new(options)
  end

  def test_deck_has_name
    assert_equal("Default Deck", @deck.name)
  end

  def test_deck_has_player_id
    assert_equal(1, @deck.player_id)
  end

end
