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
    @input = gets.chomp.downcase
    case @input
    when "p", "play"
      play
    when "i", "instructions"
      instructions
    when "q", "quit"
      quit
    else
      puts message.invalid_input
      self.start_input
    end
  end

  def quit
    puts message.quitter
    exit!
  end

  def instructions
    puts message.instructions
    puts message.lets_play
    start_input
  end

  def play
    sequence.generate
    timer.start
    puts message.heres_your_choices
    @guess_count = 0
    game_flow
  end

  def game_flow
    until num_correct_position == 4 do
      puts message.whats_your_guess
      @guess = gets.chomp.downcase
      submit_guess
    end
  end

  def submit_guess
    case
    when @guess == "q", @guess == "quit"
      quit
    when @guess == "c", @guess == "cheat"
      cheat
    when @guess.length != 4
      wrong_length
    when @guess.delete("rbgy").empty?
      evaluate_guess
    else
      puts message.try_again
    end
  end

  def cheat
    puts sequence.cheat_code
    puts message.cheater
  end

  def wrong_length
    if @guess.length > 4
      puts message.too_long
    else
      puts message.too_short
    end
  end

  def evaluate_guess
    num_correct_total
    @guess_count += 1
    if num_correct_position == 4
      you_win
    else
      puts message.progress_report(guesses, @guess_count, num_correct_total, num_correct_position)
    end
  end

  def num_correct_total(guess_colors = guesses, sequence_colors = sequence.secret_code)
    colors = ['r', 'g', 'b', 'y']
    guess_nums_correct = colors.map { |color| guess_colors.count(color) }
    sequence_nums_correct = colors.map { |color| sequence_colors.count(color) }
    compare_colors = guess_nums_correct.zip(sequence_nums_correct)
    num_correct_total = compare_colors.sum { |index| index.min }
  end

  def num_correct_position(guess_colors = guesses, sequence_colors = sequence.secret_code)
    compare_positions = sequence_colors.zip(guess_colors)
    num_correct_position = compare_positions.count { |index| index[0] == index[1] }
  end

  def guesses
    @guess.split(//)
  end

  def you_win
    timer.end
    puts message.congrats(guesses, @guess_count, timer.elapsed_minutes, timer.elapsed_seconds)
    start_input
  end

end
