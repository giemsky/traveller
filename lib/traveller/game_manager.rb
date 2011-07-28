module Traveller
  class GameManager
    attr_reader :moves, :current_move
    
    def initialize(cities, board, *players)
      @players = players
      @cities  = cities
      @board   = board
      @moves   = []
    end
    
    def build_track(connection)
      
    end
    
    def move(city)
      
    end
    
    def destroy_track(connection)
      
    end
    
    def use_card(card)
      
    end
  end
end