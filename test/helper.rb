require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'test/unit'
require 'shoulda'

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'traveller'

class Test::Unit::TestCase
  def get_connections
    # [city1, city2, distance]
    [
      [0, 1, 1], [0, 2, 3], [0, 3, 7], [0, 8, 9],
      [1, 2, 3], [1, 3, 2], [1, 7, 4],
      [2, 3, 2], [2, 4, 6], [2, 8, 5],
      [3, 4, 5], [3, 5, 1], [3, 6, 1], [3, 7, 4],
      [4, 8, 6], [4, 5, 7],
      [5, 6, 2], [5, 8, 1],
      [6, 7, 2]
    ]
  end
  
  def get_board(connections, cities)
    board = Traveller::Board.new(cities)
    connections.each do |city1, city2, distance|
      board.add_connection(
        Traveller::Connection.new(cities[city1], cities[city2], distance)
      )
    end
    board
  end
  
  def get_cities(connections)
    cities = Traveller::Cities.new
    connections.size.times{ cities.add(Traveller::City.new) }
    cities
  end
end
