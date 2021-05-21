class Game
  attr_reader :guess, :guess_count, :message

  def initialize(message)
    @guess_count = 0
    @guess = ""
    @message = message
  end

  def start_input #loop?
    loop do
      @input = gets.chomp.downcase
      play if @input == 'p' || @input == "play" #case statements
      instructions if @input == 'i' || @input == 'instructions'
      if @input == 'q' || @guess = 'q' || @guess = 'quit' || @input == 'quit'
        puts "goodbye" # make message.goodbye method
        return
      else
        puts message.you_got_this
        # self.start_input#loop?
      end
    end
  end

  def play
    generate_sequence
    @time1 = Time.now
    puts message.heres_your_choices
    @guess_count = 0 #do we need to redefine this? ref line 5
    game_flow
  end

  def instructions
    puts message.instructions
    puts message.lets_play
    self.start_input
  end

  def generate_sequence
    @sequence = Sequence.new
    @sequence.generate
  end

  def game_flow
    loop do
      puts message.whats_your_guess
      @guess = gets.chomp.downcase
      if @guess == 'q' || @guess == 'quit'
        return #input needs to change too (ref 17) #return a quit
      elsif @guess == 'c' || @guess == 'cheat'
        puts @sequence.cheat_code; self.game_flow
      elsif @guess.length != 4
        @guess.length > 4 ? (puts message.too_long; self.game_flow) : (puts message.too_short; self.game_flow)
      # elsif @guess.none?(/[rgby]/)
      #   message.you_got_this
        # self.game_flow
      elsif @guess.length == 4
        @guess_count += 1
        evaluate_guess
      # consider adding conditional statement for if the input isnt those 4 letters
      end
    end
  end
#abstract, encapsulate
  def evaluate_guess
    num_correct_total
    if num_correct_position == 4
      you_win
    else
      puts message.progress_report(@guess, @guess_count, num_correct_total, num_correct_position)
      game_flow
    end
  end

  def num_correct_total(guess_colors = @guess.split(//), sequence_colors = @sequence.secret_code)
    colors = ['r', 'g', 'b', 'y']
    guess_nums_correct = colors.map { |color| guess_colors.count(color) }
    sequence_nums_correct = colors.map { |color| sequence_colors.count(color) }
    zipper = guess_nums_correct.zip(sequence_nums_correct)
    num_correct_total = zipper.sum { |index| index.min }
  end

  def num_correct_position(guess_colors = @guess.split(//), sequence_colors = @sequence.secret_code)
    zipped_code = sequence_colors.zip(guess_colors)
    num_correct_position = zipped_code.count { |index| index[0] == index[1] }
  end

  def you_win
    time2 = Time.now
    elapsed_seconds = ((time2 - @time1) % 60).round
    elapsed_minutes = ((time2 - @time1) / 60).floor
    puts message.congrats(@guess, @guess_count, elapsed_minutes, elapsed_seconds)
    start_input
  end

end
