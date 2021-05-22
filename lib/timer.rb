class Timer
  attr_reader :time0, :time1

  def initialize
    @time0 = 0
    @time1 = 0
  end

  def start_time
    @time0 = Time.now
  end

  def end_time
    @time1 = Time.now
  end

  def elapsed_time
    @time1 - @time0
  end

  def elapsed_time_minutes
    (elapsed_time / 60).floor
  end

  def elapsed_time_seconds
    (elapsed_time % 60).round
  end


end
