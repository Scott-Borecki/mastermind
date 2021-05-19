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

    describe '#num_correct_total' do

      it '#num_correct_total test 1' do
        game = Game.new
        guess = ['b', 'b', 'b', 'b']
        sequence = ['r', 'y', 'y', 'g']
        expect(game.num_correct_total(guess, sequence)).to eq(0)
      end

      it '#num_correct_total test 2' do
        game = Game.new
        guess = ['b', 'g', 'y', 'g']
        sequence = ['r', 'y', 'y', 'g']
        expect(game.num_correct_total(guess, sequence)).to eq(2)
      end

      it '#num_correct_total test 3' do
        game = Game.new
        guess = ['y', 'b', 'r', 'g']
        sequence = ['g', 'y', 'b', 'r']
        expect(game.num_correct_total(guess, sequence)).to eq(4)
      end

      it '#num_correct_total test 4' do
        game = Game.new
        guess = ['g', 'y', 'b', 'r']
        sequence = ['g', 'y', 'b', 'r']
        expect(game.num_correct_total(guess, sequence)).to eq(4)
      end

    end

    describe '#num_correct_position' do

      it '#num_correct_position test 1' do
        game = Game.new
        guess = ['b', 'b', 'b', 'b']
        sequence = ['r', 'y', 'y', 'g']
        expect(game.num_correct_position(guess, sequence)).to eq(0)
      end

      it '#num_correct_position test 2' do
        game = Game.new
        guess = ['b', 'g', 'y', 'g']
        sequence = ['r', 'y', 'y', 'g']
        expect(game.num_correct_position(guess, sequence)).to eq(2)
      end

      it '#num_correct_position test 3' do
        game = Game.new
        guess = ['y', 'b', 'r', 'g']
        sequence = ['g', 'y', 'b', 'r']
        expect(game.num_correct_position(guess, sequence)).to eq(0)
      end

      it '#num_correct_position test 4' do
        game = Game.new
        guess = ['g', 'y', 'b', 'r']
        sequence = ['g', 'y', 'b', 'r']
        expect(game.num_correct_position(guess, sequence)).to eq(4)
      end

    end

  end

end
