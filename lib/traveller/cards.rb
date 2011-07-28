module Traveller
  module Cards
    @cards = []
    
    def self.register(card)
      @cards.push(card)
    end
  end
end

require 'traveller/cards/build_track'
require 'traveller/cards/destroy_track'
require 'traveller/cards/extra_move'