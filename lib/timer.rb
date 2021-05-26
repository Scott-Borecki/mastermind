class Timer

  def initialize
    @start = Time.new
    @end = Time.new
  end

  def start
    @start = Time.now
  end

  def end
    @end = Time.now
  end

  def elapsed_minutes
    ((@end - @start) / 60).floor
  end

  def elapsed_seconds
    ((@end - @start) % 60).round
  end
end
