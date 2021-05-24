class Message

  def initialize
  end

  def welcome
    "


                    \u{1f9e0} \u{1f9e0} \u{1f9e0} \u{1f9e0} \u{1f9e0} \u{1f9e0} \u{1f9e0} \u{1f9e0} \u{1f9e0} \u{1f9e0} \u{1f9e0} \u{1f9e0} \u{1f9e0} \u{1f9e0}

         \u{1f9e0} \u{1f9e0} \u{1f9e0} \u{1f9e0} \u{1f9e0} \u{1f9e0} \u{1f9e0} Welcome to MASTERMIND \u{1f9e0} \u{1f9e0} \u{1f9e0} \u{1f9e0} \u{1f9e0} \u{1f9e0} \u{1f9e0}

                   \u{1f9e0} \u{1f9e0} \u{1f9e0} \u{1f9e0} \u{1f9e0} \u{1f9e0} \u{1f9e0} \u{1f9e0} \u{1f9e0} \u{1f9e0} \u{1f9e0} \u{1f9e0} \u{1f9e0} \u{1f9e0}



          Would you like to (p)lay, read the (i)nstructions, or (q)uit?
                             ^                ^                  ^

    "
  end

  def you_got_this
    "That seemed tough ... try again!

    "
  end

  def instructions
    "
                     \u{1f9e0} \u{1f9e0} \u{1f9e0} \u{1f9e0} INSTRUCTIONS: \u{1f9e0} \u{1f9e0} \u{1f9e0} \u{1f9e0}

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
                             ...oh wait, wrong game ¯\\_(ツ)_/¯

    "
  end

  def quitter
    "Goodbye, ya quitter!"
  end


  def lets_play
    "

          Would you like to (p)lay, read the (i)nstructions, or (q)uit?
                             ^                ^                  ^

    "
  end

  def heres_your_choices
    "
                              Let's Play MASTERMIND!

                      I have generated a beginner sequence
                         with four letters made up of:

                \u{1f534} (r)ed, \u{1f7e2} (g)reen, \u{1f535} (b)lue, and \u{1f7e1} (y)ellow.
                    ^         ^           ^              ^
                     Use (q)uit at any time to end the game.
                          ^"
  end

  def whats_your_guess
    "
                                What's your guess?
 ////--<========---<=======--<====---<===--<==---|
||||"
  end

  def cheater
    "
          |----------------------------------|
          |      Cheaters never prosper!     |
          |         -Abe Linkedin            |
          |----------------------------------|
    "
  end

  def too_long
    "
    That's too long!  Remember, you only need to type 4 letters.
    "
  end

  def too_short
    "
    That's too short! Remember, you need to type 4 letters.
    "
  end

  def try_again
    "
    Try again!  Remember that each of the four positions needs to be
    either r, g, b, or y to be a valid input!
    "
  end

  def colored_circles(guesses)
      color_hash = {
        "r" => "\u{1f534}",
        "y" => "\u{1f7e1}",
        "g" => "\u{1f7e2}",
        "b" => "\u{1f535}",
      }

      (guesses.map { |color| color_hash[color] }).join
  end

  def progress_report(guesses, guess_count, num_correct_total, num_correct_position)
    "                       Guess#       #{guess_count}
                       Guess:   #{colored_circles(guesses)}
              Correct Colors:     * #{num_correct_total} *
           Correct Positions:    ** #{num_correct_position} **"
  end

  def congrats(guesses, guess_count, elapsed_minutes, elapsed_seconds)
    "
        \u{1f389}\u{1f38a}\u{1f389}\u{1f38a}\u{1f389}\u{1f38a}\u{1f389}\u{1f38a}\u{1f389}\u{1f38a}\u{1f389}\u{1f38a}\u{1f389}\u{1f38a}\u{1f389}\u{1f38a}\u{1f389}\u{1f38a}\u{1f389}\u{1f38a}\u{1f389}\u{1f38a}\u{1f389}\u{1f38a}\u{1f389}\u{1f38a}\u{1f389}\u{1f38a}\u{1f389}\u{1f38a}\u{1f389}\u{1f38a}
        \u{1f38a}\u{1f389}\u{1f38a}\u{1f389}\u{1f38a}\u{1f389}\u{1f38a}\u{1f389}\u{1f38a}\u{1f389}\u{1f38a}\u{1f389}\u{1f38a}\u{1f389}\u{1f38a}\u{1f389}\u{1f38a}\u{1f389}\u{1f38a}\u{1f389}\u{1f38a}\u{1f389}\u{1f38a}\u{1f389}\u{1f38a}\u{1f389}\u{1f38a}\u{1f389}\u{1f38a}\u{1f389}\u{1f38a}\u{1f389}
        \u{1f389}\u{1f38a}\u{1f389}\u{1f38a}\u{1f389}\u{1f38a}\u{1f389}\u{1f38a}\u{1f389}\u{1f38a}\u{1f389}\u{1f38a}\u{1f389}\u{1f38a}\u{1f389}\u{1f38a}\u{1f389}\u{1f38a}\u{1f389}\u{1f38a}\u{1f389}\u{1f38a}\u{1f389}\u{1f38a}\u{1f389}\u{1f38a}\u{1f389}\u{1f38a}\u{1f389}\u{1f38a}\u{1f389}\u{1f38a}
        \u{1f38a}\u{1f389}\u{1f38a}\u{1f389}\u{1f38a}\u{1f389}\u{1f38a}\u{1f389}\u{1f38a}\u{1f389}\u{1f38a}\u{1f389}\u{1f38a}\u{1f389}\u{1f38a}\u{1f389}\u{1f38a}\u{1f389}\u{1f38a}\u{1f389}\u{1f38a}\u{1f389}\u{1f38a}\u{1f389}\u{1f38a}\u{1f389}\u{1f38a}\u{1f389}\u{1f38a}\u{1f389}\u{1f38a}\u{1f389}
        \u{1f389}\u{1f38a}\u{1f389}\u{1f38a}\u{1f389}\u{1f38a}\u{1f389}\u{1f38a}\u{1f389}\u{1f38a}\u{1f389}\u{1f38a}\u{1f389}\u{1f38a}\u{1f389}\u{1f38a}\u{1f389}\u{1f38a}\u{1f389}\u{1f38a}\u{1f389}\u{1f38a}\u{1f389}\u{1f38a}\u{1f389}\u{1f38a}\u{1f389}\u{1f38a}\u{1f389}\u{1f38a}\u{1f389}\u{1f38a}

                                Congratulations!

                           You guessed the sequence!

                                    #{colored_circles(guesses)}

                                  in #{guess_count} guesses
                           over #{elapsed_minutes} minutes, #{elapsed_seconds} seconds.


        \u{1f389}\u{1f38a}\u{1f389}\u{1f38a}\u{1f389}\u{1f38a}\u{1f389}\u{1f38a}\u{1f389}\u{1f38a}\u{1f389}\u{1f38a}\u{1f389}\u{1f38a}\u{1f389}\u{1f38a}\u{1f389}\u{1f38a}\u{1f389}\u{1f38a}\u{1f389}\u{1f38a}\u{1f389}\u{1f38a}\u{1f389}\u{1f38a}\u{1f389}\u{1f38a}\u{1f389}\u{1f38a}\u{1f389}\u{1f38a}
        \u{1f38a}\u{1f389}\u{1f38a}\u{1f389}\u{1f38a}\u{1f389}\u{1f38a}\u{1f389}\u{1f38a}\u{1f389}\u{1f38a}\u{1f389}\u{1f38a}\u{1f389}\u{1f38a}\u{1f389}\u{1f38a}\u{1f389}\u{1f38a}\u{1f389}\u{1f38a}\u{1f389}\u{1f38a}\u{1f389}\u{1f38a}\u{1f389}\u{1f38a}\u{1f389}\u{1f38a}\u{1f389}\u{1f38a}\u{1f389}
        \u{1f389}\u{1f38a}\u{1f389}\u{1f38a}\u{1f389}\u{1f38a}\u{1f389}\u{1f38a}\u{1f389}\u{1f38a}\u{1f389}\u{1f38a}\u{1f389}\u{1f38a}\u{1f389}\u{1f38a}\u{1f389}\u{1f38a}\u{1f389}\u{1f38a}\u{1f389}\u{1f38a}\u{1f389}\u{1f38a}\u{1f389}\u{1f38a}\u{1f389}\u{1f38a}\u{1f389}\u{1f38a}\u{1f389}\u{1f38a}
        \u{1f38a}\u{1f389}\u{1f38a}\u{1f389}\u{1f38a}\u{1f389}\u{1f38a}\u{1f389}\u{1f38a}\u{1f389}\u{1f38a}\u{1f389}\u{1f38a}\u{1f389}\u{1f38a}\u{1f389}\u{1f38a}\u{1f389}\u{1f38a}\u{1f389}\u{1f38a}\u{1f389}\u{1f38a}\u{1f389}\u{1f38a}\u{1f389}\u{1f38a}\u{1f389}\u{1f38a}\u{1f389}\u{1f38a}\u{1f389}
        \u{1f389}\u{1f38a}\u{1f389}\u{1f38a}\u{1f389}\u{1f38a}\u{1f389}\u{1f38a}\u{1f389}\u{1f38a}\u{1f389}\u{1f38a}\u{1f389}\u{1f38a}\u{1f389}\u{1f38a}\u{1f389}\u{1f38a}\u{1f389}\u{1f38a}\u{1f389}\u{1f38a}\u{1f389}\u{1f38a}\u{1f389}\u{1f38a}\u{1f389}\u{1f38a}\u{1f389}\u{1f38a}\u{1f389}\u{1f38a}

    Do you want to (p)lay again or (q)uit

"
  end
end
