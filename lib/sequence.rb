class Sequence

  attr_reader :secret_code

  def initialize
    @secret_code = []
  end

  def generate
    colors = ['r', 'g', 'b', 'y']
    4.times { @secret_code << colors.sample }
  end

  def cheat_code
    @secret_code.join.upcase
  end

end
