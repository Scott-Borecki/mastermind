require 'rspec'
require 'pry'
require './lib/sequence'
require './lib/game'
require './lib/message'
require './lib/timer'

RSpec.describe Game do

  describe 'Object Creation' do

    before(:each) do
      timer = Timer.new
      message = Message.new
      sequence = Sequence.new
      @game = Game.new(message, sequence, timer)
    end

    it 'exists' do
      expect(@game).to be_a(Game)
    end

    it 'has readable attributes' do
      expect(@game.guess_count).to be_an_instance_of(Integer)
      expect(@game.guess).to be_an_instance_of(String)
      expect(@game.message).to be_an_instance_of(Message)
      expect(@game.sequence).to be_an_instance_of(Sequence)
      expect(@game.timer).to be_an_instance_of(Timer)

      expect(@game.guess_count).to eq(0)
      expect(@game.guess).to eq("")
    end
  end

  describe 'Object Methods' do

    before(:each) do
      timer = Timer.new
      message = Message.new
      @sequence = Sequence.new
      @game = Game.new(message, @sequence, timer)
    end

    it 'can count the correct colors and positions' do
      # test case with multiple colors (b) in guess
      allow(@game).to receive(:guesses).and_return(['b', 'b', 'b', 'b'])
      allow(@sequence).to receive(:secret_code).and_return(['r', 'y', 'y', 'g'])

      expect(@game.num_correct_total).to eq(0)
      expect(@game.num_correct_position).to eq(0)

      # test case with multiple same colors (g) in guess and multiple same colors (y) in sequence
      allow(@game).to receive(:guesses).and_return(['b', 'g', 'y', 'g'])
      allow(@sequence).to receive(:secret_code).and_return(['r', 'y', 'y', 'g'])

      expect(@game.num_correct_total).to eq(2)
      expect(@game.num_correct_position).to eq(2)

      # test case with all colors correct but wrong positions
      allow(@game).to receive(:guesses).and_return(['y', 'b', 'r', 'g'])
      allow(@sequence).to receive(:secret_code).and_return(['g', 'y', 'b', 'r'])

      expect(@game.num_correct_total).to eq(4)
      expect(@game.num_correct_position).to eq(0)

      # test case with all colors and positions correct
      allow(@game).to receive(:guesses).and_return(['g', 'y', 'b', 'r'])
      allow(@sequence).to receive(:secret_code).and_return(['g', 'y', 'b', 'r'])

      expect(@game.num_correct_total).to eq(4)
      expect(@game.num_correct_position).to eq(4)
    end

    it 'can split guess string into an array' do
      @game.instance_variable_set(:@guess, "bbbb")

      expected = ["b", "b", "b", "b"]
      expect(@game.guesses).to be_an_instance_of(Array)
      expect(@game.guesses).to eq(expected)
    end

    it 'can play when asked to' do
      allow(@game).to receive(:game_flow).and_return(true)
      allow(@game).to receive(:puts).and_return(nil)
      expect(@game.play).to be(true)
    end

    describe '#start_input' do
      it 'responds to (p) input' do
        allow(@game).to receive(:gets).and_return("p")
        allow(@game).to receive(:play).and_return(true)
        expect(@game.start_input).to be(true)
      end

      it 'responds to (play) input' do
        allow(@game).to receive(:gets).and_return("play")
        allow(@game).to receive(:play).and_return(true)
        expect(@game.start_input).to be(true)
      end

      it 'responds to (i) input' do
        allow(@game).to receive(:gets).and_return("i")
        allow(@game).to receive(:instructions).and_return(true)
        expect(@game.start_input).to be(true)
      end

      it 'responds to (instructions) input' do
        allow(@game).to receive(:gets).and_return("instructions")
        allow(@game).to receive(:instructions).and_return(true)
        expect(@game.start_input).to be(true)
      end

      it 'responds to (q) input' do
        allow(@game).to receive(:gets).and_return("q")
        allow(@game).to receive(:quit).and_return(true)
        expect(@game.start_input).to be(true)
      end

      it 'responds to (quit) input' do
        allow(@game).to receive(:gets).and_return("quit")
        allow(@game).to receive(:quit).and_return(true)
        expect(@game.start_input).to be(true)
      end
    end

    describe '#submit_guess' do

      it 'responds to (q) input' do
        @game.instance_variable_set(:@guess, "q")
        allow(@game).to receive(:quit).and_return(true)
        expect(@game.submit_guess).to be(true)
      end

      it 'responds to (quit) input' do
        @game.instance_variable_set(:@guess, "quit")
        allow(@game).to receive(:quit).and_return(true)
        expect(@game.submit_guess).to be(true)
      end

      it 'responds to (c) input' do
        @game.instance_variable_set(:@guess, "c")
        allow(@game).to receive(:cheat).and_return(true)
        expect(@game.submit_guess).to be(true)
      end

      it 'responds to (cheat) input' do
        @game.instance_variable_set(:@guess, "cheat")
        allow(@game).to receive(:cheat).and_return(true)
        expect(@game.submit_guess).to be(true)
      end

      it 'responds to wrong length input' do
        @game.instance_variable_set(:@guess, "bb")
        allow(@game).to receive(:wrong_length).and_return(true)
        expect(@game.submit_guess).to be(true)
      end

      it 'responds to wrong length input' do
        @game.instance_variable_set(:@guess, "bbbbb")
        allow(@game).to receive(:wrong_length).and_return(true)
        expect(@game.submit_guess).to be(true)
      end

      it 'responds to invalid input' do
        @game.instance_variable_set(:@guess, "bsdf")
        allow(@game).to receive(:puts).and_return(true)
        expect(@game.submit_guess).to be(true)
      end
    end
  end
end
