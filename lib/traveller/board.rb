module Traveller
  class Board
    def initialize(cities)
      @connections = []
      @cities      = cities
    end
    
    def add_connection(connection)
      @connections.push(connection)
    end
    
    def [](city1, city2)
      if city1.is_a?(Integer) && city2.is_a?(Integer)
        find_by_index(city1, city2)
      elsif city1.is_a?(City) && city2.is_a?(City)
        find_by_city(city1, city2)
      else
        raise ArgumentError
      end
    end
    
    private
    
    def find_by_index(city1, city2)
      @connections.find do |c|
        (c.city1 == @cities[city1] || c.city1 == @cities[city2]) &&
          (c.city2 == @cities[city2] || c.city2 == @cities[city1])
      end      
    end
    
    def find_by_city(city1, city2)
      @connections.find do |c|
        (c.city1 == city1 || c.city1 == city2) &&
          (c.city2 == city2 || c.city2 == city1)
      end
    end
    
  end
end