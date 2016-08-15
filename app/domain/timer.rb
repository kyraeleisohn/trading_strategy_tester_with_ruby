class Timer
  def start
    @start_time = Time.now
  end

  def time_spent
    Time.now.to_i - @start_time.to_i
  end
end