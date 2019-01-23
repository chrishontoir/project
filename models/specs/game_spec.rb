require('minitest/autorun')
require('minitest/rg')
require_relative('../game.rb')

class GameTest < Minitest::Test

  def setup
    options = {"date" => "20/01/2019 10:00", "player1_id" => 1, "player1_health" => 30, "player1_power" => 2, "player1_deck" => 4, "player1_hand" => "", "player1_played" => 3, "player2_id" => 2, "player2_health" => 27, "player2_power" => 4, "player2_deck" => 1, "player2_hand" => "", "player2_played" => 6, "status" => 7}
    @game = Game.new(options)
  end

  def test_game_has_date
    assert_equal("20/01/2019 10:00", @game.date)
  end

  def test_game_player1_id
    assert_equal(1, @game.player1_id)
  end

  def test_game_player1_health
    assert_equal(30, @game.player1_health)
  end

  def test_game_player1_power
    assert_equal(2, @game.player1_power)
  end

  def test_game_player1_deck
    assert_equal(4, @game.player1_deck)
  end

  def test_game_player1_hand
    assert_equal("", @game.player1_hand)
  end

  def test_game_player1_played
    assert_equal(3, @game.player1_played)
  end

  def test_game_player2_id
    assert_equal(2, @game.player2_id)
  end

  def test_game_player2_health
    assert_equal(27, @game.player2_health)
  end

  def test_game_player2_power
    assert_equal(4, @game.player2_power)
  end

  def test_game_player2_deck
    assert_equal(1, @game.player2_deck)
  end

  def test_game_player2_hand
    assert_equal("", @game.player2_hand)
  end

  def test_game_player2_played
    assert_equal(6, @game.player2_played)
  end

  def test_game_status
    assert_equal(7, @game.status)
  end

end
