require 'rspec'
require 'pry'
require './lib/sequence'
require './lib/game'
require './lib/message'
require './lib/timer'

RSpec.describe Timer do

  before(:each) do
    @timer = Timer.new
  end

  describe 'Object Creation' do

    it 'exists' do
      expect(@timer).to be_an_instance_of(Timer)
    end
  end

  describe 'Object Methods' do

    it "records the start time" do
      expect(@timer.start).to be_an_instance_of(Time)
    end

    it "records the end time" do
      expect(@timer.end).to be_an_instance_of(Time)
    end

    it 'can output minutes elapsed' do
      # test case where (start) minutes is less than (end) minutes in timecode format
      @timer.instance_variable_set(:@start, Time.new(2021, 10, 31, 2, 0, 2, "-04:00"))
      @timer.instance_variable_set(:@end, Time.new(2021, 10, 31, 2, 2, 2, "-04:00"))

      expect(@timer.elapsed_minutes).to be_an_instance_of(Integer)
      expect(@timer.elapsed_minutes).to eq(2)

      # test case where (start) minutes is greater than (end) minutes in timecode format
      @timer.instance_variable_set(:@start, Time.new(2021, 10, 31, 1, 59, 2, "-04:00"))
      @timer.instance_variable_set(:@end, Time.new(2021, 10, 31, 2, 2, 2, "-04:00"))

      expect(@timer.elapsed_minutes).to be_an_instance_of(Integer)
      expect(@timer.elapsed_minutes).to eq(3)
    end

    it 'can output seconds elapsed' do
      # test case where (start) seconds is less than (end) second in timecode format
      @timer.instance_variable_set(:@start, Time.new(2021, 10, 31, 2, 2, 2, "-04:00"))
      @timer.instance_variable_set(:@end, Time.new(2021, 10, 31, 2, 2, 22, "-04:00"))

      expect(@timer.elapsed_seconds).to be_an_instance_of(Integer)
      expect(@timer.elapsed_seconds).to eq(20)

      # test case where (start) seconds is greater than (end) seconds in timecode format
      @timer.instance_variable_set(:@start, Time.new(2021, 10, 31, 2, 1, 52, "-04:00"))
      @timer.instance_variable_set(:@end, Time.new(2021, 10, 31, 2, 2, 22, "-04:00"))

      expect(@timer.elapsed_seconds).to be_an_instance_of(Integer)
      expect(@timer.elapsed_seconds).to eq(30)
    end
  end
end
