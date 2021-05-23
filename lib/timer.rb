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
    @end.min - @start.min
  end

  def elapsed_seconds
    @end.sec - @start.sec
  end
end
