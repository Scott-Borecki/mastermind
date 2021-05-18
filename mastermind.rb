require 'rspec'
require 'pry'
require './lib/sequence'
require './lib/game'
require './lib/turn'

game = Game.new

game.start_message
game.start_input
