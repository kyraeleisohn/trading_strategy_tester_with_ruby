
class StrategyFormula
  def initialize(
    trade_handler,
    strategy_parameter_list,
    strategy_description_mapper,
    chart,
    chart_mapper
  )
    @trade_handler = trade_handler
    @strategy_parameter_list = strategy_parameter_list
    @random_factor = strategy_parameter_list[:random_factor]
    @id = generate_id
    @chart = chart
    @chart_mapper = chart_mapper

    strategy_description_mapper.store description
  end

  def tick(market_state)
    if 0 == Random.new.rand(@random_factor) then
      @trade_handler.open_buy_trade(@id, market_state)
    end

    open_trades = @trade_handler.open_trade_list
    if 0 == Random.new.rand(@random_factor) && !open_trades.empty? then
      @trade_handler.close_trade(open_trades.sample, market_state)
    end

    @chart.add(market_state.date_time, @trade_handler.current_value(market_state))
    @chart_mapper.store @chart
  end

  private

  def description
    StrategyDescription.new(
        @id,
        "random",
        @strategy_parameter_list
    )
  end

  def generate_id
    SecureRandom.hex(32)
  end
end