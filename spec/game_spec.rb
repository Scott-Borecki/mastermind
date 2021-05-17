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

end
