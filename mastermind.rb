require 'rspec'
require 'pry'
require './lib/sequence'
require './lib/game'
require './lib/message'


game = Game.new


# game.start_message
game.message.welcome
game.start_input
