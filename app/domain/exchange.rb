
class Exchange
  LOG_FREQUENCY = 1000

  def initialize(
      feed,
      status,
      status_mapper,
      chart,
      chart_mapper,
      timer,
      strategy_list
  )
    @feed = feed
    @status = status
    @status_mapper = status_mapper
    @chart = chart
    @chart_mapper = chart_mapper
    @timer = timer
    @strategy_list = strategy_list
    @cycle_count = 0
  end

  def run
    start @feed.count
    @feed.each do |market_state|
      @strategy_list.enforce market_state
      finish_cycle market_state
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

  def finish_cycle(market_state)
    @chart.add(market_state.date_time, {'ask_price' => market_state.ask_price})
    @status.finish_cycle
    @status.time_spent = @timer.time_spent

    if  @cycle_count == 0 || @cycle_count % LOG_FREQUENCY == 0 then
      log
    end
    @cycle_count += 1
  end

  def log
    @status_mapper.store @status
    @chart_mapper.store @chart
  end
end