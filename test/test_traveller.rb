require 'helper'

class TestTraveller < Test::Unit::TestCase
  def test_game
    # [city1, city2, distance]
    connections = [
      [0, 1, 1], [0, 2, 3], [0, 3, 7], [0, 8, 9],
      [1, 2, 3], [1, 3, 2], [1, 7, 4],
      [2, 3, 2], [2, 4, 6], [2, 8, 5],
      [3, 4, 5], [3, 5, 1], [3, 6, 1], [3, 7, 4],
      [4, 8, 6], [4, 5, 7],
      [5, 6, 2], [5, 8, 1],
      [6, 7, 2]
    ]
    
    # initialize cities
    cities = Traveller::Cities.new
    connections.size.times{ cities.add(Traveller::City.new) }
    
    # initialize board
    board = Traveller::Board.new
    connections.each do |city1, city2, distance|
      board.add_connection(
        Traveller::Connection.new(cities[city1], cities[city2], distance)
      )
    end
    
    # initialize players
    player1 = Traveller::Player.new('John', cities[0])
    player2 = Traveller::Player.new('Kate', cities[5])
    
    # initialize manager, the game master :)
    manager = Traveller::GameManager.new(player1, player2, cities, board)

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
    manager.use_card(player2.cards[0])
    manager.build_track(board[6, 3])
    
    # player 1 tries to build track which exists
    manager.build_track(board[6, 3]) # => TrackExistsError
    
    # player 1 tries to move without built track
    manager.move(board[6, 3]) # => NoTrackForMoveError
    
    # check travelled distances
    player1.distance # => 1
    player2.distance # => 2
    
    # check visited cities
    player1.visited_cities # => [0, 1]
    player2.visited_cities # => [5, 6]
  end
end