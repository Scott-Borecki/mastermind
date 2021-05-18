class Game

  def initialize
    @guess_count = 0
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
      @time1 = Time.now
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
    @sequence = Sequence.new
    @sequence.generate
  end

  def game_flow
    puts "I have generated a beginner sequence with four elements made up of: (r)ed,
    (g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game.
    What's your guess?"
    @guess = gets.chomp
    if @guess == 'q' || @guess == 'quit'
    elsif @guess == 'c' || @guess == 'cheat'
      puts @sequence.secret_code.join.upcase
      self.game_flow
    elsif @guess.length > 4
      puts "That's too long!"
    elsif @guess.length < 4
      puts "That's too short!"
    elsif @guess.length == 4
      @guess_count += 1
      evaluate_guess
    end
  end

  def evaluate_guess
    if num_correct_position == 4
      @time2 = Time.now
      @elapsed_seconds = ((@time2 - @time1) % 60).round
      @elapsed_minutes = ((@time2 - @time1) / 60).floor
      puts "Congratulations! You guessed the sequence '#{@guess.upcase}' in #{@guess_count} guesses over #{@elapsed_minutes} minutes, #{@elapsed_seconds} seconds."
      puts ""
      puts "Do you want to (p)lay again or (q)uit"
      start_input
    else # @num_correct_position < 4
      puts "'#{@guess.upcase}' has #{num_correct_total} of the correct elements with #{num_correct_position} in the correct positions"
      puts "You've taken #{@guess_count} guess" # update for single guess
      game_flow
    end
  end

  def num_correct_total
    @guess_array = @guess.split(//)
    @sequence_array = @sequence.secret_code
    # @guess_array = ['r', 'g', 'b', 'y']
    # @sequence = ['y','y','y','y']

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

    tally_r_code = @sequence_array.count do |letter|
      letter.include?("r")
    end
    tally_g_code = @sequence_array.count do |letter|
      letter.include?("g")
    end
    tally_b_code = @sequence_array.count do |letter|
      letter.include?("b")
    end
    tally_y_code = @sequence_array.count do |letter|
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

  end

  def num_correct_position
    @guess_array = @guess.split(//)
    @sequence_array = @sequence.secret_code
    @num_correct_position = 0
    if @guess_array[0] == @sequence_array[0]
      @num_correct_position += 1
    end
    if @guess_array[1] == @sequence_array[1]
      @num_correct_position += 1
    end
    if @guess_array[2] == @sequence_array[2]
      @num_correct_position += 1
    end
    if @guess_array[3] == @sequence_array[3]
      @num_correct_position += 1
    end
    @num_correct_position
  end

  # def quit
  # end

end
