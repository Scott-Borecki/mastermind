require 'rspec'
require 'pry'
require './lib/sequence'
require './lib/game'
require './lib/message'

message = Message.new
sequence = Sequence.new
game = Game.new(message, sequence)

puts message.welcome
game.start_input
