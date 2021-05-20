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
    puts "\n" "INSTRUCTIONS:" "\n" "
    The object of MASTERMIND is to guess a 4 letter secret code.
    Each guess results in feedback narrowing down the possibilities of the code.
    You win if you guess the secret code.

    Hope you're ready for a real barrel of fun... oh wait, wrong game ¯\\_(ツ)_/¯." "\n" "\n"
  end

  def whats_your_guess
    puts "\n"
    puts "\u{1f9e0} " * 25
    puts "\n" "I have generated a beginner sequence with four letters made up of:" "\n"
    puts "(r)ed, (g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game." "\n""\n"
    puts "What's your guess?" "\n"
  end

  def too_long
    puts "\n"
    puts "That's too long!  Remember, you only need to type 4 letters." "\n"
  end

  def too_short
    puts "\n"
    puts "That's too short! Remember, you need to type 4 letters." "\n"
  end

  def guess_progress
    puts "\n"
    puts "\u{1f9e0} " * 25
    puts "\n" "'#{colored_circles}' has #{@num_correct_total} of the correct elements with #{@num_correct_position} in the correct positions." "\n"
    if @guess_count == 1
      puts "You've taken #{@guess_count} guess""\n""\n"
    else
      puts "You've taken #{@guess_count} guesses""\n""\n"
    end
  end

  def congrats
    puts "\n"
    puts "\u{1f389}\u{1f38a}" * 25
    puts "\u{1f38a}\u{1f389}" * 25
    puts "\u{1f389}\u{1f38a}" * 25
    puts "\u{1f38a}\u{1f389}" * 25
    puts "\u{1f389}\u{1f38a}" * 25

    puts "\n" "Congratulations! You guessed the sequence '#{colored_circles}' in #{@guess_count} guesses over #{@elapsed_minutes} minutes, #{@elapsed_seconds} seconds." "\n"
    puts "\n"
    puts "\u{1f389}\u{1f38a}" * 25
    puts "\u{1f38a}\u{1f389}" * 25
    puts "\u{1f389}\u{1f38a}" * 25
    puts "\u{1f38a}\u{1f389}" * 25
    puts "\u{1f389}\u{1f38a}" * 25
    puts "\n"
    puts "Do you want to (p)lay again or (q)uit?" "\n"
  end

  def colored_circles(guess_colors = @guess.split(//))
      color_hash = {
        "r" => "\u{1f534}",
        "y" => "\u{1f7e1}",
        "g" => "\u{1f7e2}",
        "b" => "\u{1f535}",
      }

      (guess_colors.map { |color| color_hash[color] }).join
  end

end
