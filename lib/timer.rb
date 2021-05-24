class Timer

  def initialize
    @start = ""
    @end = ""
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
    (@end - @start).round
  end
end
