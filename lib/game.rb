class Game

  def initialize
  end

intro_message = "I have generated a beginner sequence with four elements made up of: (r)ed,
(g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game.
What's your guess?"

  def start_message
    puts "Welcome to MASTERMIND"
    puts " ~-~ " * 4
    puts "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
  end

  def intro_message
    puts "I have generated a beginner sequence with four elements made up of: (r)ed,
    (g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game.
    What's your guess?"
    @guess = gets.chomp
  end

  # def game_flow
  #   if @guess
  # end

  def start_input
    @input = gets.chomp.downcase
    if @input == 'p' || @input == "play"
      intro_message
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

  def quit
  end


end
