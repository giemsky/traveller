module Traveller
  class Move
    attr_reader :player
    
    def initialize(player, manager)
      @player  = player
      @manager = manager
    end
    
    def build_track(connection)
      connection.add_track(@player)
    end
    
    def move(city)
      connection = @manager.board[@player.current_city, city]
      
      raise NoConnectionError unless connection
      raise NoTrackForMoveError unless connection.movable?(@player)

      player.move(city, connection.distance)
    end
    
    def destroy_track(connection)
      connection.destroy_track
    end
    
    def use_card(card, *params)
      card.use(self, *params)
    end
  end
end