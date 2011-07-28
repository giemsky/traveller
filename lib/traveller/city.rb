module Traveller
  class City
    
    def initialize(bonus_card = nil)
      @bonus_card = bonus_card
      @visited    = false
    end
    
    def card_available
      @visited ? nil : @bonus_card
    end
    
    def visit
      @visited = true
    end
    
  end
end