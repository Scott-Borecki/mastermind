class Game
  attr_reader :guess, :guess_count, :message, :sequence, :timer

  def initialize(message, sequence, timer)
    @guess_count = 0
    @guess = ""
    @message = message
    @sequence = sequence
    @timer = timer
  end

  def start_input
    loop do
      @input = gets.chomp.downcase
      case @input
      when "p" || "play"
        play
      when "i" || "instructions"
        instructions
      when "q" || "quit"
        quit
      else
        puts message.you_got_this
      end
    end
  end

  def try_again
    puts message.you_got_this
    start_input
  end

  def quit
    puts "Goodbye, ya quitter!"
    exit!
  end

  def play
    generate_sequence
    timer.start
    puts message.heres_your_choices
    @guess_count = 0
    game_flow
  end

  def instructions
    puts message.instructions
    puts message.lets_play
    start_input
  end

  def generate_sequence
    sequence.generate
  end

  def game_flow
    loop do
      puts message.whats_your_guess
      @guess = gets.chomp.downcase
      guess_method # Let's come up with a better method name
    end
  end

  def guess_method # Let's come up with a better method name
    case
    when @guess == "q", @guess == "quit"
      quit
    when @guess == "c", @guess == "cheat"
      puts sequence.cheat_code # make a method sequence.cheat_code?
    when @guess.length != 4
      @guess.length > 4 ? ( puts message.too_long ) : ( puts message.too_short )
    when @guess.delete("rbgy").empty?
      @guess_count += 1
      evaluate_guess
    else
      puts message.you_got_this # consider new message to give user more feedback on invalid input
    end
  end
# abstract, encapsulate
  def evaluate_guess
    num_correct_total
    if num_correct_position == 4
      you_win
    else
      puts message.progress_report(@guess, @guess_count, num_correct_total, num_correct_position) # perhaps put all arguments in a hash and reference the hash.  Then use the hash in messages?  Just an idea
      game_flow
    end
  end
# make new method for @guess.split(//) called #guess_array
# make sequence.secret_code it's own method
# split into multiple methods
  def num_correct_total(guess_colors = @guess.split(//), sequence_colors = sequence.secret_code)
    colors = ['r', 'g', 'b', 'y'] # make this its own method?
    guess_nums_correct = colors.map { |color| guess_colors.count(color) } # make this one method with an argument
    sequence_nums_correct = colors.map { |color| sequence_colors.count(color) } # make this one method with an argument
    zipper = guess_nums_correct.zip(sequence_nums_correct)
    num_correct_total = zipper.sum { |index| index.min }
  end

  def num_correct_position(guess_colors = @guess.split(//), sequence_colors = sequence.secret_code)
    zipped_code = sequence_colors.zip(guess_colors)
    num_correct_position = zipped_code.count { |index| index[0] == index[1] }
  end

  # def elapsed_minutes
  #   timer.elapsed_minutes
  # end
  #
  # def elapsed_seconds
  #   timer.elapsed_seconds
  # end

  def you_win
    timer.end
    puts message.congrats(@guess, @guess_count, timer.elapsed_minutes, timer.elapsed_seconds)
    start_input
  end

end
