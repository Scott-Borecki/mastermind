require 'rspec'
require 'pry'
require './lib/sequence'
require './lib/game'
require './lib/message'

RSpec.describe Message do
  describe 'object creation' do

    it 'exists' do
      message = Message.new

      expect(message).to be_a(Message)
    end

    it 'has readable attributes' do
      message = Message.new

      expect(message.guess).to be_a(String)
      expect(message.elapsed_minutes).to be_a(String)
      expect(message.elapsed_seconds).to be_a(String)
      expect(message.guess_count).to be_a(String)
      expect(message.num_correct_position).to be_a(String)
      expect(message.num_correct_total).to be_a(String)

      expect(message.guess).to eq("")
      expect(message.elapsed_minutes).to eq("")
      expect(message.elapsed_seconds).to eq("")
      expect(message.guess_count).to eq("")
      expect(message.num_correct_position).to eq("")
      expect(message.num_correct_total).to eq("")
    end
  end

  describe 'object methods' do

    it 'outputs colored circles' do
      message = Message.new
      guess_colors = ['r', 'b', 'y', 'g',]

      expected = "\u{1f534}""\u{1f535}""\u{1f7e1}""\u{1f7e2}"

      expect(message.colored_circles(guess_colors)).to be_a(String)
      expect(message.colored_circles(guess_colors)).to eq(expected)
    end
    # no tests performed on the following methods because their purpose
    # is to output text to the terminal:
    #
    # #welcome, #you_got_this, #instructions, #lets_play, #whats_your_guess,
    # #too_long, #too_short, #progress_report
  end
end
