class Timer
  def start
    @start_time = Time.now
  end

  def time_spent
    Time.now - @start_time
  end
end