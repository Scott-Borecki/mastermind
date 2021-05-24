class Sequence

  attr_reader :secret_code

  def initialize
    @secret_code = Array.new(4)
  end

  def generate
    colors = ['r', 'g', 'b', 'y']
    @secret_code = secret_code.map { |index| colors.sample }
  end

  def cheat_code
    @secret_code.join.upcase
  end

end
