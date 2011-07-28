require 'traveller/board'
require 'traveller/cities'
require 'traveller/city'
require 'traveller/connection'
require 'traveller/game_manager'
require 'traveller/move'
require 'traveller/player'
require 'traveller/track'
require 'traveller/traveller'

module Traveller
  class TrackExistsError            < StandardError; end
  class NoTrackToDestroyError       < StandardError; end
  class AlreadyDestroyedTrackError  < StandardError; end
  class NoConnectionError           < StandardError; end
  class NoTrackForMoveError         < StandardError; end
end