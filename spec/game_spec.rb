require 'rspec'
require 'pry'
require './lib/sequence'
require './lib/game'

RSpec.describe Game do

  describe 'Object creation' do
    it 'exists' do
      game = Game.new
      expect(game).to be_a(Game)
    end
  end

  describe 'Object Methods' do
    # it '#num_correct_position' do
    #   game = Game.new
    #   sequence = Sequence.new
    #   @guess = "rrrr"
    #   sequence.generate
    #   # @sequence.secret_code = ['r','r','r','r']
    #   expect(game.num_correct_position).to eq(4)
    # end
  end

end
