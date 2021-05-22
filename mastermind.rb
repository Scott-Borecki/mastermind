require 'rspec'
require 'pry'
require './lib/sequence'
require './lib/game'
require './lib/message'
require './lib/timer'


timer = Timer.new
message = Message.new
sequence = Sequence.new
game = Game.new(message, sequence, timer)

puts message.welcome
game.start_input
