module Traveller
  class Connection
    attr_reader :city1, :city2, :distance, :track
    
    def initialize(city1, city2, distance)
      @city1    = city1
      @city2    = city2
      @distance = distance
    end
    
    def add_track(owner)
      raise TrackExistsError if track && !track.destroyed?
      
      @track = Track.new(owner)
    end
    
    def destroy_track
      raise NoTrackToDestroyError unless track
      
      @track.destroy
    end
    
    def movable?(player)
      return false unless track
      
      track.movable?(player)
    end
  end
end