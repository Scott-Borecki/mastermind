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
end
