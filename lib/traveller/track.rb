module Traveller
  class Track
    attr_reader :owner
    
    def initialize(owner)
      @owner         = owner
      @destroyed     = false
      @was_destroyed = false
    end
    
    def destroyed?
      @destroyed
    end
    
    def was_destroyed?
      @was_destroyed
    end
    
    def rebuild(player)
      @destroyed = false
      @owner     = player
    end
    
    def destroy
      raise AlreadyDestroyedTrackError if destroyed?

      @destroyed     = true
      @was_destroyed = true
    end
    
    def is_owner?(player)
      @owner == player
    end
    
    def movable?(player)
      is_owner?(player) && !destroyed?
    end
  end
end