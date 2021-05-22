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

  describe 'Object creation' do

    it 'exists' do
      expect(@timer).to be_an_instance_of(Timer)
    end
  end

  describe 'Object methods' do

    it "records the start time" do
      expect(@timer.start_time).to be_an_instance_of(Time)
    end

    it "records the end time" do
      expect(@timer.end_time).to be_an_instance_of(Time)
    end

    # it "knows the difference between start and end" do
    #   initial = Time.new(2020, 10, 31, 2, 2, 2, "-04:00").year
    #   final = Time.new(2021, 10, 31, 2, 2, 2, "-04:00").year
    #
    #   expect(@timer.elapsed_time(initial, final)).to be_an_instance_of(Integer)
    #   expect(@timer.elapsed_time(initial, final)).to eq(1)
    #
    # end

  
    # it "can convert time to minutes" do
    # #   initial = Time.new(2021, 10, 31, 2, 0, 2, "-04:00").min
    #   final = Time.new(2021, 10, 31, 2, 2, 2, "-04:00").min
    #
    #   @timer.elapsed_time = 120
    #   expect(@timer.elapsed_time_minutes).to eq(2)
    #
    # # end
    #   @initial = Time.new(2020, 10, 31, 1, 1, 1, "-04:00")
    #   @final = Time.new(2021, 10, 31, 2, 2, 2, "-04:00")
    #   @timer.elapsed_time(@initial, @final)
    #   expect(@timer.elapsed_time_minutes).to be_an_instance_of(Integer)
    #   require "pry"; binding.pry
    #   expect(@timer.elapsed_time_minutes).to eq(1)

  end
end
