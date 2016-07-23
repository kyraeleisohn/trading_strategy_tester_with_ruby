
class Strategy
  def initialize(trade_handler, strategy_parameter_list)
    @trade_handler = trade_handler
    @strategy_parameter_list = strategy_parameter_list
    @random_factor = strategy_parameter_list[:random_factor]
    @id = generate_id
  end

  def tick(market_state)
    if 0 == Random.new.rand(@random_factor) then
      @trade_handler.open_buy_trade(@id, market_state)
    end

    open_trades = @trade_handler.open_trade_list
    if 0 == Random.new.rand(@random_factor) && !open_trades.empty? then
      @trade_handler.close_trade(open_trades.sample, market_state)
    end
  end

  def description
    StrategyDescription.new(
        @id,
        "random",
        @strategy_parameter_list
    )
  end

  private
  def generate_id
    SecureRandom.hex(32)
  end
end