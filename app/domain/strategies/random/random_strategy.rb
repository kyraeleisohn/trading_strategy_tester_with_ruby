
class RandomStrategy < Strategy
  protected
  def act(market_state)
    random_factor = @parameter_list[:random_factor]

    if 0 == Random.new.rand(random_factor) then
      @trade_handler.open_buy_trade(@id, market_state)
    end

    open_trades = @trade_handler.open_trade_list
    if 0 == Random.new.rand(random_factor) && !open_trades.empty? then
      @trade_handler.close_trade(open_trades.sample, market_state)
    end

    super market_state
  end
end