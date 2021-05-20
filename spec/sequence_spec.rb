require 'rspec'
require 'pry'
require './lib/sequence'

RSpec.describe Sequence do

  before(:each) do
    @sequence = Sequence.new
  end

  describe 'Object Creation' do

    it 'exists' do
      expect(@sequence).to be_a(Sequence)
    end

    it 'has readable attributes' do
      expect(@sequence.secret_code).to eq([])
    end
  end

  describe 'Object Methods' do

    it '#generate' do
      @sequence.generate
      expect(@sequence.secret_code).to be_a(Array)
      expect(@sequence.secret_code.length).to eq(4)
      expect(@sequence.secret_code.none?(/[rgby]/)).to be false
      expect(@sequence.secret_code.all?(/[rgby]/)).to be true
    end

    it "has a cheat code" do
      secret_code = ['r', 'g', 'b', 'y']
      @sequence.secret_code << secret_code
      @sequence.secret_code.flatten
      expected = "RGBY"

      expect(@sequence.cheat_code).to be_a(String)
      expect(@sequence.cheat_code).to eq(expected)
    end
  end
end
