module Traveller
  class City
    attr_reader :bonus_card
    
    def initialize(bonus_card = nil)
      @bonus_card = bonus_card
    end
    
    def clear_bonus_card
      @bonus_card = nil
    end
  end
end