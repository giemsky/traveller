module Traveller
  class City
    attr_writer :bonus_card
    
    def initialize
      @visited = false
    end
    
    def card_available
      @visited ? nil : @bonus_card
    end
    
    def visit
      @visited = true
    end
    
  end
end