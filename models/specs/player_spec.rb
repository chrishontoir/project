require('minitest/autorun')
require('minitest/rg')
require_relative('../player.rb')

class PlayerTest < Minitest::Test

  def setup
    options = {"name" => "Chris", "avatar" => "/images/fireball.png", "admin" => 1}
    @player = Player.new(options)
  end

  def test_player_has_name
    assert_equal("Chris", @player.name)
  end

  def test_player_has_avatar
    assert_equal("/images/fireball.png", @player.avatar)
  end

  def test_player_has_admin_status
    assert_equal(1 , @player.admin)
  end

end
