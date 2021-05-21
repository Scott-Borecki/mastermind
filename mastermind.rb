require 'rspec'
require 'pry'
require './lib/sequence'
require './lib/game'
require './lib/message'

message = Message.new
game = Game.new(message)

puts message.welcome
game.start_input
