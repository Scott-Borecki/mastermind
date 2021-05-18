class Game

  def initialize
  end

  def start_message
    puts "Welcome to MASTERMIND"
    puts " ~-~ " * 4
    puts "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
  end

  def start_input
    @input = gets.chomp.downcase
    if @input == 'p' || @input == "play"
      generate_sequence
      game_flow
    elsif @input == 'i' || @input == 'instructions'
      puts "Instructions will go here, now that you've got it:"
      puts ""
      puts ""
        start_message
      self.start_input
    elsif @input == 'q' || @input == 'quit'
    else
      p "That seemed tough, try again"
        self.start_input
    end
  end

  def generate_sequence
    sequence = Sequence.new
    sequence.generate
  end

  def game_flow
    puts "I have generated a beginner sequence with four elements made up of: (r)ed,
    (g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game.
    What's your guess?"
    @guess = gets.chomp
    if @guess == 'q' || @guess == 'quit'
    elsif @guess == 'c' || @guess == 'cheat'
      puts sequence.secret_code.join.upcase
      self.game_flow
    elsif @guess.length > 4
      puts "That's too long!"
    elsif @guess.length < 4
      puts "That's too short!"
    elsif @guess.length == 4
      evaluate_guess
    end
  end

  def evaluate_guess
    puts "'#{@guess.upcase}' has #{@num_correct_total} of the correct elements with #{@num_correct_position} in the correct positions"
    puts "You've taken #{guess_count} guess"
  end

  def num_correct_total
    # @guess_array = @guess.split(//)
    # @sequence = sequence.secret_code
    @guess_array = ['r', 'g', 'b', 'y']
    @sequence = ['y','y','y','y']

    tally_r_guess = @guess_array.count do |letter|
      letter.include?("r")
    end
    tally_g_guess = @guess_array.count do |letter|
      letter.include?("g")
    end
    tally_b_guess = @guess_array.count do |letter|
      letter.include?("b")
    end
    tally_y_guess = @guess_array.count do |letter|
      letter.include?("y")
    end

    tally_r_code = @sequence.count do |letter|
      letter.include?("r")
    end
    tally_g_code = @sequence.count do |letter|
      letter.include?("g")
    end
    tally_b_code = @sequence.count do |letter|
      letter.include?("b")
    end
    tally_y_code = @sequence.count do |letter|
      letter.include?("y")
    end

    tally_r = []
    tally_r << tally_r_guess
    tally_r << tally_r_code
    tally_g = []
    tally_g << tally_g_guess
    tally_g << tally_g_code
    tally_b = []
    tally_b << tally_b_guess
    tally_b << tally_b_code
    tally_y = []
    tally_y << tally_y_guess
    tally_y << tally_y_code

    @num_correct_total = tally_r.min + tally_g.min + tally_b.min + tally_y.min

    require "pry"; binding.pry

  end

  def num_correct_position
    @guess_array = @guess.split(//)
    @sequence = sequence.secret_code
    @num_correct_position = 0
    if @guess_array[0] == @sequence[0]
      @num_correct_position += 1
    end
    if @guess_array[1] == @sequence[1]
      @num_correct_position += 1
    end
    if @guess_array[2] == @sequence[2]
      @num_correct_position += 1
    end
    if @guess_array[3] == @sequence[3]
      @num_correct_position += 1
    end
  end

  def quit
  end


end
