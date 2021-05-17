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
      p "right"
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
