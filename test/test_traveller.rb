require 'helper'

class TestTraveller < Test::Unit::TestCase
  def setup
    @connections = get_connections
  end
  
  def test_game
    cities = get_cities(@connections)
    board  = get_board(@connections, cities)
    
    # add cards to some cities
    cities[0].bonus_card = Traveller::Cards::BuildTrack.new
    cities[1].bonus_card = Traveller::Cards::DestroyTrack.new
    cities[5].bonus_card = Traveller::Cards::ExtraMove.new
    cities[6].bonus_card = Traveller::Cards::BuildTrack.new
    
    # initialize players
    player1 = Traveller::Player.new('John', cities[0])
    player2 = Traveller::Player.new('Kate', cities[5])
    
    # initialize manager, the game master :)
    manager = Traveller::GameManager.new(cities, board, player1, player2)

    #
    # let's begin!
    #
    
    # player 1 building track 0-1
    manager.build_track(board[0, 1])
    
    # player 2 building track 5-6
    manager.build_track(board[5, 6])
    
    # player 1 moving from 0 to 1
    manager.move(cities[1])
    
    # player 2 moving from 5 to 6
    manager.move(cities[6])
    
    # player 1 destroys opponent's track
    manager.destroy_track(board[5, 6])
    
    # player 2 uses bonus card
    manager.use_card(player2.cards[0], board[3, 7])
    manager.build_track(board[6, 3])
    
    # player 1 tries to build track which exists
    assert_raise(Traveller::TrackExistsError) do
      manager.build_track(board[6, 3])
    end

    # player 1 again, builds track 2 to 4
    manager.build_track(board[2, 4])
    
    # player 2 tries to move without built track
    assert_raise(Traveller::NoTrackForMoveError) do
      manager.move(cities[7])
    end
    
    # player 2 again, builds track 3 to 4
    manager.build_track(board[3, 4])
    
    # player 1 rebuilds the track
    manager.build_track(board[5, 6])
    
    # player 2 moves from 6 to 3
    manager.move(cities[3])
    
    # check travelled distances
    assert_equal 1, player1.distance
    assert_equal 3, player2.distance
    
    # check visited cities
    assert_equal [cities[0], cities[1]], player1.visited_cities
    assert_equal [cities[5], cities[6], cities[3]], player2.visited_cities
  end
end