module Traveller
  class Board
    def initialize
      @connections = []
    end
    
    def add_connection(connection)
      @connections.push(connection)
    end
    
    def [](city1, city2)
      @connections.find do |c|
        (c.city1 == city1 || c.city1 == city2) &&
          (c.city2 == city2 || c.city2 == city1)
      end
    end
  end
end