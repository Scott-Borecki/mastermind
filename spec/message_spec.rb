require 'rspec'
require 'pry'
require './lib/sequence'
require './lib/game'
require './lib/message'

RSpec.describe Message do
  before(:each) do
    @message = Message.new
  end

  describe 'object creation' do

    it 'exists' do
      expect(@message).to be_a(Message)
    end
  end

  describe 'object methods' do

    it 'outputs colored circles' do
      guess_colors = ['r', 'b', 'y', 'g',]
      expected = "\u{1f534}""\u{1f535}""\u{1f7e1}""\u{1f7e2}"

      expect(@message.colored_circles(guess_colors)).to be_a(String)
      expect(@message.colored_circles(guess_colors)).to eq(expected)
    end

    it 'has welcome message' do
      expected = "Welcome to MASTERMIND"

      expect(@message.welcome).to be_a(String)
      expect(@message.welcome).to include(expected)
    end

    it 'has you_got_this message' do
      expected = "That seemed tough ... try again!"

      expect(@message.you_got_this).to be_a(String)
      expect(@message.you_got_this).to include(expected)
    end

    it 'has instructions message' do
      expected = "The object of MASTERMIND is to guess a secret code."

      expect(@message.instructions).to be_a(String)
      expect(@message.instructions).to include(expected)
    end

    it 'has lets_play message' do
      expected = "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"

      expect(@message.lets_play).to be_a(String)
      expect(@message.lets_play).to include(expected)
    end

    it 'has heres_your_choices message' do
      expected = "Let's Play MASTERMIND!"

      expect(@message.heres_your_choices).to be_a(String)
      expect(@message.heres_your_choices).to include(expected)
    end

    it 'has whats_your_guess message' do
      expected = "What's your guess?"

      expect(@message.whats_your_guess).to be_a(String)
      expect(@message.whats_your_guess).to include(expected)
    end

    it 'has too_long message' do
      expected = "That's too long!"

      expect(@message.too_long).to be_a(String)
      expect(@message.too_long).to include(expected)
    end

    it 'has too_short message' do
      expected = "That's too short!"

      expect(@message.too_short).to be_a(String)
      expect(@message.too_short).to include(expected)
    end

    # Need to look up RSpec expections to make this one work.  Include isn't working.
    #
    # it 'has progress_report message' do
    #   expected = "1 \u{1f535}\u{1f535}\u{1f535}\u{1f535} 3 2"
    #
    #   expect(@message.progress_report(1, "bbbb", 3, 2)).to be_a(String)
    #   expect(@message.progress_report(1, "bbbb", 3, 2)).to include(expected)
    # end

    it 'has congrats message' do

    end
  end
end
