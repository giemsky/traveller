module Traveller
  class Connection
    attr_reader :city1, :city2, :distance, :track
    
    def initialize(city1, city2, distance)
      @city1    = city1
      @city2    = city2
      @distance = distance
    end
  end
end