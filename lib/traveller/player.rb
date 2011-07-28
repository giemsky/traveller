module Traveller
  class Player
    attr_reader   :name, :cards
    attr_accessor :distance
    
    def initialize(name, starting_city)
      @name          = name
      @traveller     = Traveller.new(starting_city)
      @cards         = []
    end
    
    def visited_cities
      @traveller.visited_cities
    end
    
    def distance
      @traveller.travelled_distance
    end
    
    def add_card(card)
      @cards.push(card)
    end
    
    def current_city
      @traveller.current_city
    end
    
    def move(city, distance)
      @cards.push(city.card_available) if city.card_available
      @traveller.move(city, distance)
    end
  end
end