module Traveller
  class Track
    attr_reader :owner, :destroyed
    
    def initialize(owner)
      @owner     = owner
      @destroyed = false
    end
  end
end