class Game
  attr_reader :message, :guess

  def initialize
    @guess_count = 0
    @message = Message.new
    @guess = guess
  end

  def start_input
    @input = gets.chomp.downcase
    if @input == 'p' || @input == "play"
      play
    elsif @input == 'i' || @input == 'instructions'
      instructions
    elsif @input == 'q' || @input == 'quit'
    else
      message.you_got_this
      self.start_input
    end
  end

  def play
    generate_sequence
    @time1 = Time.now
    game_flow
  end

  def instructions
    message.instructions
    message.welcome
    self.start_input
  end

  def generate_sequence
    @sequence = Sequence.new
    @sequence.generate
  end

  def game_flow
    message.whats_your_guess
    @guess = gets.chomp.downcase
    if @guess == 'q' || @guess == 'quit'
    elsif @guess == 'c' || @guess == 'cheat'
      puts @sequence.secret_code.join.upcase; self.game_flow
    elsif @guess.length > 4 || @guess.length < 4
      @guess.length > 4 ? (message.too_long; self.game_flow) : (message.too_short; self.game_flow)
    elsif @guess.length == 4
      @guess_count += 1
      message.guess = @guess
      message.guess_count = @guess_count
      evaluate_guess
    # consider adding conditional statement for if the input isnt those 4 letters
    end
  end

  def evaluate_guess
    num_correct_total
    if num_correct_position == 4
      you_win
    else
      message.guess_progress
      game_flow
    end
  end

  def num_correct_total
    guess_array = @guess.split(//)
    sequence_array = @sequence.secret_code
    color_array = ['r', 'g', 'b', 'y']
    guess_array_correct = color_array.map { |color| guess_array.count(color) }
    sequence_array_correct = color_array.map { |color| sequence_array.count(color) }
    zipper = guess_array_correct.zip(sequence_array_correct)
    num_correct_total = zipper.sum { |index| index.min }
    message.num_correct_total = num_correct_total
  end

  def num_correct_position
    guess_array = @guess.split(//)
    sequence_array = @sequence.secret_code
    zipped_code = sequence_array.zip(guess_array)
    num_correct_position = zipped_code.count { |index| index[0] == index[1] }
    message.num_correct_position = num_correct_position
  end

  def you_win
    @time2 = Time.now
    @elapsed_seconds = ((@time2 - @time1) % 60).round
    @elapsed_minutes = ((@time2 - @time1) / 60).floor
    message.elapsed_minutes = @elapsed_minutes
    message.elapsed_seconds = @elapsed_seconds
    message.congrats
    start_input
  end

end
