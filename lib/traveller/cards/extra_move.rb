module Traveller
  module Cards
    class ExtraMove
      Cards.register(self)
      
      def use(move, city)
        raise AlreadyUsedCardError if used?
        
        move.move(city)
        @used = true
      end
      
      def used?
        !!@used
      end
      
    end
  end
end