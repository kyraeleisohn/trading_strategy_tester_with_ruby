
class Exchange
  def initialize(
      feed,
      strategy_description_mapper,
      status,
      status_mapper,
      timer
  )
    @feed = feed
    @strategy_description_mapper = strategy_description_mapper
    @strategy_list = Array.new
    @status = status
    @status_mapper = status_mapper
    @timer = timer
  end

  def run
    start @feed.count
    @feed.each do |market_state|
      enforce market_state
    end
    finish
  end

  def register(strategy)
    @strategy_list.push strategy
    @strategy_description_mapper.store strategy.description
  end

  private
  def enforce(market_state)
    @strategy_list.each do |strategy|
      strategy.tick market_state
    end
    finish_cycle
  end

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
    log
  end

  def log
    @status_mapper.store @status
  end
end