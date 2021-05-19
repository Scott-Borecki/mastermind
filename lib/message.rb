class Message
  # use attr_accessor because object values need to be overwritten and readable
  attr_accessor :guess, :elapsed_minutes, :elapsed_seconds, :guess_count, :num_correct_position, :num_correct_total

  def initialize
    @guess = ""
    @elapsed_minutes = ""
    @elapsed_seconds = ""
    @guess_count = ""
    @num_correct_position = ""
    @num_correct_total = ""
  end

  def welcome
    puts "Welcome to MASTERMIND"
    puts " ~-~ " * 4
    puts "Would you like to (p)lay, read the (i)nstructions, or (q)uit?" "\n"
  end

  def you_got_this
    puts "That seemed tough, try again" "\n" "\n"
  end

  def instructions
    puts "\n" "INSTRUCTIONS:" "\n" "The object of MASTERMIND is to guess a secret code consisting of a series of 4
colored pegs. Each guest results in feedback narrowing down the possibilities of the
code. The winner is the player who solves his opponent's secret code with fewer
guesses." "\n" "\n"
  end

  def whats_your_guess
    puts "\n" "I have generated a beginner sequence with four elements made up of: (r)ed,
    (g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game.
    What's your guess?" "\n"
  end

  def too_long
    puts "That's too long!" "\n"
  end

  def too_short
    puts "That's too short!" "\n"
  end

  def guess_progress
    puts "\n" "'#{@guess.upcase}' has #{@num_correct_total} of the correct elements with #{@num_correct_position} in the correct positions." "\n"
    if @guess_count == 1
      puts "You've taken #{@guess_count} guess"
    else
      puts "You've taken #{@guess_count} guesses"
    end
  end

  def congrats
    puts "\n" "Congratulations! You guessed the sequence '#{@guess.upcase}' in #{@guess_count} guesses over #{@elapsed_minutes} minutes, #{@elapsed_seconds} seconds." "\n"
    puts "Do you want to (p)lay again or (q)uit?" "\n"
  end

end
