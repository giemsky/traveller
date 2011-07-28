module Traveller
  module Cards
    class DestroyTrack
      Cards.register(self)
      
      def use(move, connection)
        raise AlreadyUsedCardError if used?
        
        move.destroy_track(connection)
        @used = true
      end
      
      def used?
        !!@used
      end
      
    end
  end
end