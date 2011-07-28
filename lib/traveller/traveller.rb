module Traveller
  class Traveller
    attr_reader :current_city, :visited_cities, :travelled_distance
    
    def initialize(starting_city)
      @visited_cities     = []
      @travelled_distance = 0
      move(starting_city, 0)
    end
    
    def move(city, distance)
      @current_city = city
      @visited_cities.push(city)
      @travelled_distance += distance
      city.visit
    end
  end
end