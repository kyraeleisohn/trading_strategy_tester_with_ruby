
class AaaStrategy < Strategy
  THRESHOLD = 0.00007

  protected
  def act(market_state)
    super market_state

    threshold = @parameter_list[:threshold]
    psar = @indicator_list.psar_indicator

    if psar.value.nil?
      return
    end

    if psar.value < market_state.ask_price - threshold && @open_trade.nil? then
      @open_trade = @trade_handler.open_sell_trade(@id, market_state)
    end

    if psar.value > market_state.ask_price + threshold && !@open_trade.nil? then
      @trade_handler.close_trade(@open_trade, market_state)
      @open_trade = nil
    end
  end
end