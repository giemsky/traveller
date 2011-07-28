module Traveller
  class Player
    attr_reader   :name, :cards, :starting_city
    attr_accessor :distance
    
    def initialize(name, starting_city)
      @name          = name
      @traveller     = Traveller.new(starting_city)
      @cards         = []
      @starting_city = starting_city
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
  end
end