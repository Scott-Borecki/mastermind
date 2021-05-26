require 'rspec'
require 'pry'
require './lib/sequence'
require './lib/game'
require './lib/message'

RSpec.describe Message do
  before(:each) do
    @message = Message.new
  end

  describe 'Object Creation' do

    it 'exists' do
      expect(@message).to be_a(Message)
    end
  end

  describe 'Object Methods' do

    it 'has welcome message' do
      expected = "Welcome to MASTERMIND"

      expect(@message.welcome).to be_a(String)
      expect(@message.welcome).to include(expected)
    end

    it 'has invalid_input message' do
      expected = "That seemed tough ... try again!"

      expect(@message.invalid_input).to be_a(String)
      expect(@message.invalid_input).to include(expected)
    end

    it 'has instructions message' do
      expected = "The object of MASTERMIND is to guess a secret code."

      expect(@message.instructions).to be_a(String)
      expect(@message.instructions).to include(expected)
    end

    it 'has quitter message' do
      expected = "Goodbye, ya quitter!"

      expect(@message.quitter).to be_a(String)
      expect(@message.quitter).to include(expected)
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

    it 'has cheater message' do
      expected = "Abe Linkedin"

      expect(@message.cheater).to be_a(String)
      expect(@message.cheater).to include(expected)
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

    it 'has try_again message' do
      expected = "Try again!"

      expect(@message.try_again).to be_a(String)
      expect(@message.try_again).to include(expected)
    end

    it 'outputs colored circles' do
      guesses = ["r", "b", "y", "g"]
      expected = "\u{1f534}""\u{1f535}""\u{1f7e1}""\u{1f7e2}"

      expect(@message.colored_circles(guesses)).to be_a(String)
      expect(@message.colored_circles(guesses)).to eq(expected)
    end

    it 'has progress_report message' do
      guess_data = {
        guesses: ["b", "b", "b", "b"],
        guess_count: 4,
        num_correct_total: 2,
        num_correct_position: 1,
        }

      expected_1 = "\u{1f535}\u{1f535}\u{1f535}\u{1f535}"
      expected_2 = "4"
      expected_3 = "2"
      expected_4 = "1"

      expect(@message.progress_report(guess_data)).to be_a(String)
      expect(@message.progress_report(guess_data)).to include(expected_1)
      expect(@message.progress_report(guess_data)).to include(expected_2)
      expect(@message.progress_report(guess_data)).to include(expected_3)
      expect(@message.progress_report(guess_data)).to include(expected_4)
    end

    it 'has congrats message' do
      guess_data = {
        guesses: ["b", "b", "b", "b"],
        guess_count: 4,
        elapsed_minutes: 2,
        elapsed_seconds: 1,
        }

      expected_1 = "\u{1f535}\u{1f535}\u{1f535}\u{1f535}"
      expected_2 = "4"
      expected_3 = "2"
      expected_4 = "1"

      expect(@message.congrats(guess_data)).to be_a(String)
      expect(@message.congrats(guess_data)).to include(expected_1)
      expect(@message.congrats(guess_data)).to include(expected_2)
      expect(@message.congrats(guess_data)).to include(expected_3)
      expect(@message.congrats(guess_data)).to include(expected_4)
    end
  end
end
