class Message
  attr_accessor :guess, :elapsed_minutes, :elapsed_seconds, :guess_count

  def initialize
    @guess = ""
    @elapsed_minutes = ""
    @elapsed_seconds = ""
    @guess_count = ""
  end

  def welcome
    puts "Welcome to MASTERMIND"
    puts " ~-~ " * 4
    puts "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
  end

  def congrats
    puts "Congratulations! You guessed the sequence '#{@guess.upcase}' in #{@guess_count} guesses over #{@elapsed_minutes} minutes, #{@elapsed_seconds} seconds."
    puts ""
    puts "Do you want to (p)lay again or (q)uit"
  end
  def whats_your_guess
    puts "I have generated a beginner sequence with four elements made up of: (r)ed,
    (g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game.
    What's your guess?"
  end

end
