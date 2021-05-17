require 'rspec'
require 'pry'
require '../lib/sequence.rb'

RSpec.describe Sequence do

  describe 'Object Creation' do

    it 'exists' do
      sequence = Sequence.new
      expect(sequence).to be_a(Sequence)
    end

    it 'has readable attributes' do
      sequence = Sequence.new
      expect(sequence.secret_code).to eq([])
    end

  end

  describe 'Object Methods' do

    it '#generate' do
      sequence = Sequence.new

      sequence.generate
      expect(sequence.secret_code).to be_a(Array)
      expect(sequence.secret_code.length).to eq(4)
      # expect(sequence.generate).to include('r', 'g', 'b', 'y')
    end

  end

end
