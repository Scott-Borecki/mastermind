require 'rspec'
require 'pry'
require './lib/sequence'
require './lib/game'
require './lib/turn'

RSpec.describe Turn do

  describe 'Object creation' do
    it 'exists' do
      turn = Turn.new
      expect(turn).to be_a(Turn)
    end
  end
end
