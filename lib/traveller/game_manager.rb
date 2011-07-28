module Traveller
  class GameManager
    attr_reader :moves, :current_move, :board
    
    def initialize(cities, board, *players)
      @players      = players
      @board        = board
      @current_move = Move.new(@players.first, self)
      @moves        = [@current_move]
    end
    
    def build_track(connection)
      @current_move.build_track(connection)
      next_move
    end
    
    def move(city)
      @current_move.move(city)
      next_move
    end
    
    def destroy_track(connection)
      @current_move.destroy_track(connection)
      next_move
    end
    
    def use_card(card, *params)
      @current_move.use_card(card, *params)
    end
    
    private
    
    def next_move
      @current_move = Move.new(next_player, self)
      @moves.push(@current_move)
    end
    
    def next_player
      @players[@moves.size % @players.size]
    end
  end
end