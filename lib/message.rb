class Message
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
    puts "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
    puts ""
  end

  def instructions
    puts ""
    puts "The object of MASTERMIND is to guess a secret code consisting of a series of 4
colored pegs. Each guest results in feedback narrowing down the possibilities of the
code. The winner is the player who solves his opponent's secret code with fewer
guesses."
    puts ""
  end

  def whats_your_guess
    puts ""
    puts "I have generated a beginner sequence with four elements made up of: (r)ed,
    (g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game.
    What's your guess?"
    puts ""
  end

  def guess_progress
    puts ""
    puts "'#{@guess.upcase}' has #{@num_correct_total} of the correct elements with #{@num_correct_position} in the correct positions."
    puts ""
    if @guess_count == 1
      puts "You've taken #{@guess_count} guess"
    else
      puts "You've taken #{@guess_count} guesses"
    end
  end

  def congrats
    puts ""
    puts "Congratulations! You guessed the sequence '#{@guess.upcase}' in #{@guess_count} guesses over #{@elapsed_minutes} minutes, #{@elapsed_seconds} seconds."
    puts ""
    puts "Do you want to (p)lay again or (q)uit?"
    puts ""
  end

end
