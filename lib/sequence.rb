class Sequence

  attr_reader :secret_code

  def initialize # perhaps intialize (secret_code = []) ?
    @secret_code = [] # make this @secret_code = secret_code?  Maybe that's why it wasn't working when calling the #secret_code method
  end

  def generate
    colors = ['r', 'g', 'b', 'y']
    @secret_code = [] # test that it empties
    4.times { @secret_code << colors.sample }
  end

  def cheat_code
    @secret_code.join.upcase
  end

end
