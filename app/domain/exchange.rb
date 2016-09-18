
class Exchange
  def initialize(
      feed,
      status,
      status_mapper,
      timer,
      strategy_list
  )
    @feed = feed
    @status = status
    @status_mapper = status_mapper
    @timer = timer
    @strategy_list = strategy_list
  end

  def run
    start @feed.count
    @feed.each do |market_state|
      @strategy_list.enforce market_state
      finish_cycle
    end
    finish
  end

  private
  def start(cycle_maximum)
    @status.cycle_maximum = cycle_maximum
    @status.start
    @timer.start
    log
  end

  def finish
    @status.finish
    log
  end

  def finish_cycle
    @status.finish_cycle
    @status.time_spent = @timer.time_spent
    log
  end

  def log
    @status_mapper.store @status
  end
end