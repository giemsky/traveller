require 'helper'

class TestBoard < Test::Unit::TestCase
  def test_getter
    connections = get_connections
    cities      = get_cities(connections)
    board       = get_board(connections, cities)
    
    assert_not_nil board[0, 1]
    assert_not_nil board[cities[0], cities[1]]
    assert_equal board[0, 1], board[cities[0], cities[1]]
  end
end