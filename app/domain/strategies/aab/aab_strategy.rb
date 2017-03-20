
class AabStrategy < Strategy
  protected
  def act(market_state)
    super market_state

    threshold = @parameter_list[:threshold]
    psar = @indicator_list.psar_indicator
    ma = @indicator_list.ma_indicator

    if psar.value.nil? || ma.value.nil?
      return
    end

    if psar.value < ma.value - threshold && @open_trade.nil? then
      @open_trade = @trade_handler.open_sell_trade(@id, market_state)
    end

    if psar.value > ma.value + threshold && !@open_trade.nil? then
      @trade_handler.close_trade(@open_trade, market_state)
      @open_trade = nil
    end
  end
end