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
  end

  describe 'object methods' do

    it 'outputs colored circles' do
      message = Message.new
      guess_colors = ['r', 'b', 'y', 'g',]
      expect(message.colored_circles(guess_colors)).to be_a(String)
      expect(message.colored_circles(guess_colors)).to eq("\u{1f534}""\u{1f535}""\u{1f7e1}""\u{1f7e2}")
    end
  end
end
