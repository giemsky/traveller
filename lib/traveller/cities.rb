module Traveller
  class Cities
    def initialize
      @cities = []
    end
    
    def add(city)
      @cities.push(city)
    end
    
    def [](index)
      @cities[index]
    end
  end
end