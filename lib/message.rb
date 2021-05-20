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
    puts "\n"
    puts "\n"
    puts "\n"
    puts "                \u{1f9e0} \u{1f9e0} \u{1f9e0} \u{1f9e0} \u{1f9e0} \u{1f9e0} \u{1f9e0} \u{1f9e0} \u{1f9e0} \u{1f9e0} \u{1f9e0} \u{1f9e0} \u{1f9e0} \u{1f9e0} "
    puts "\n"
    puts "     \u{1f9e0} \u{1f9e0} \u{1f9e0} \u{1f9e0} \u{1f9e0} \u{1f9e0} \u{1f9e0} Welcome to MASTERMIND \u{1f9e0} \u{1f9e0} \u{1f9e0} \u{1f9e0} \u{1f9e0} \u{1f9e0} \u{1f9e0}"
    puts "\n"
    puts "               \u{1f9e0} \u{1f9e0} \u{1f9e0} \u{1f9e0} \u{1f9e0} \u{1f9e0} \u{1f9e0} \u{1f9e0} \u{1f9e0} \u{1f9e0} \u{1f9e0} \u{1f9e0} \u{1f9e0} \u{1f9e0} "
    puts "\n"
    puts "\n"
    puts "\n"
    puts "      Would you like to (p)lay, read the (i)nstructions, or (q)uit?" "\n"
    puts "                         ^                ^                  ^"
    puts "\n"
    puts "\n"
  end

  def you_got_this
    puts "That seemed tough, try again" "\n" "\n"
  end

  def instructions
    puts "\n" "                   \u{1f9e0} \u{1f9e0} \u{1f9e0} \u{1f9e0} INSTRUCTIONS: \u{1f9e0} \u{1f9e0} \u{1f9e0} \u{1f9e0} " "\n" "
            The object of MASTERMIND is to guess a secret code.
  When you start the game, a 4-color secret code sequence is randomly generated.

     To make a guess (if you dare!), enter a four-letter combination that
             consists of the first letter of the color name:

             \u{1f534} (r)ed, \u{1f7e2} (g)reen, \u{1f535} (b)lue, and \u{1f7e1} (y)ellow.
                 ^         ^           ^              ^
    (Hint:  The secret code can have the same color in multiple positions!)

  Each guess results in feedback narrowing down the possibilities of the code.

                 You win when you guess the secret code!


            Hope you're ready for a real barrel of fun...
                        ...oh wait, wrong game ¯\\_(ツ)_/¯" "\n"
  end


  def lets_play
    puts "\n"
    puts "\n"
    puts "      Would you like to (p)lay, read the (i)nstructions, or (q)uit?" "\n"
    puts "                         ^                ^                  ^"
    puts "\n"
    puts "\n"
  end

  def heres_your_choices
    puts "\n"
    # puts "\u{1f9e0} \u{1f9e0} \u{1f9e0}                                                         \u{1f9e0} \u{1f9e0} \u{1f9e0}"
    puts "\n" "                          Let's Play MASTERMIND!"
    puts "\n" "                  I have generated a beginner sequence"
    puts      "                     with four letters made up of:" "\n""\n"
    puts "            \u{1f534} (r)ed, \u{1f7e2} (g)reen, \u{1f535} (b)lue, and \u{1f7e1} (y)ellow." "\n"
    puts "                ^         ^           ^              ^"
    puts "                 Use (q)uit at any time to end the game."
    puts "                      ^" "\n""\n"
  end

  def whats_your_guess
    puts "\n""\n"
    puts "                           What's your guess?"
    puts " ////--<========--<=======--<====--<===--<==|"
    puts "||||"
  end

  def too_long
    puts "\n"
    puts "That's too long!  Remember, you only need to type 4 letters." "\n"
  end

  def too_short
    puts "\n"
    puts "That's too short! Remember, you need to type 4 letters." "\n"
  end

  def progress_report
    # puts "\n"
    # puts "\u{1f9e0} " * 24
    # puts "\n"
    puts "                       Guess#       #{@guess_count}"
    puts "                       Guess:   #{colored_circles}"
    puts "              Correct Colors:     * #{@num_correct_total} *"
    puts "           Correct Positions:    ** #{@num_correct_position} **"
    # puts "\n" "#{colored_circles} has #{@num_correct_total} of the correct colors with #{@num_correct_position} in the correct positions." "\n"
  end

  def congrats
    puts "\n""\n"
    puts "\u{1f389}\u{1f38a}" * 18
    puts "\u{1f38a}\u{1f389}" * 18
    puts "\u{1f389}\u{1f38a}" * 18
    puts "\u{1f38a}\u{1f389}" * 18
    puts "\u{1f389}\u{1f38a}" * 18

    puts "\n" "\n""                            Congratulations!" "\n""\n"
    puts          "                        You guessed the sequence!""\n""\n"
    puts          "                                #{colored_circles}""\n""\n"
    puts          "                              in #{@guess_count} guesses"
    puts          "                       over #{@elapsed_minutes} minutes, #{@elapsed_seconds} seconds." "\n""\n"
    puts "\n"
    puts "\u{1f389}\u{1f38a}" * 18
    puts "\u{1f38a}\u{1f389}" * 18
    puts "\u{1f389}\u{1f38a}" * 18
    puts "\u{1f38a}\u{1f389}" * 18
    puts "\u{1f389}\u{1f38a}" * 18
    puts "\n""\n""\n"
    puts "Do you want to (p)lay again or (q)uit?" "\n""\n"
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
