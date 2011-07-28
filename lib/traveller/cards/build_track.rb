module Traveller
  module Cards
    class BuildTrack
      Cards.register(self)
      
      def use(move, connection)
        raise AlreadyUsedCardError if used?
        
        move.build_track(connection)
        @used = true
      end
      
      def used?
        !!@used
      end
      
    end
  end
end