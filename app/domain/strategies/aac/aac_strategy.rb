
class AacStrategy < Strategy
  protected
  def act(market_state)
    clear_old_signals(@parameter_list[:threshold], market_state)

    update_exponential_moving_average_signal market_state
    update_macd_signal market_state
    update_psar_signal market_state

    if open_sell_trade?
      @open_trade = @trade_handler.open_sell_trade(@id, market_state)
    elsif open_buy_trade?
      @open_trade = @trade_handler.open_buy_trade(@id, market_state)
    end

    if close_sell_trade?
      @trade_handler.close_trade(@open_trade, market_state)
      @open_trade = nil
    elsif close_buy_trade?
      @trade_handler.close_trade(@open_trade, market_state)
      @open_trade = nil
    end
  end

  private
  def clear_old_signals(threshold, market_state)
    unless @psar_signal.nil?
      filter = TimeFilter.new('minute', threshold)
      filter.changed @psar_signal.date_time

      if filter.changed market_state.date_time
        @psar_signal = nil
      end
    end

    unless @exponential_moving_average_signal.nil?
      filter = TimeFilter.new('minute', threshold)
      filter.changed @exponential_moving_average_signal.date_time

      if filter.changed market_state.date_time
        @exponential_moving_average_signal = nil
      end
    end

    unless @macd_signal.nil?
      filter = TimeFilter.new('minute', threshold)
      filter.changed @macd_signal.date_time

      if filter.changed market_state.date_time
        @macd_signal = nil
      end
    end
  end

  def close_sell_trade?
    if @open_trade.nil? || !@open_trade.is_sell
      return false
    end

    exchange = @indicator_list.exchange_indicator
    psar = @indicator_list.psar_indicator
    psar.value < exchange.value
  end

  def close_buy_trade?
    if @open_trade.nil? || !@open_trade.is_buy
      return false
    end

    exchange = @indicator_list.exchange_indicator
    psar = @indicator_list.psar_indicator
    psar.value > exchange.value
  end

  def open_sell_trade?
    @open_trade.nil? &&
    !@psar_signal.nil? &&
    @psar_signal.sell? &&
    !@exponential_moving_average_signal.nil? &&
    @exponential_moving_average_signal.sell? &&
    !@macd_signal.nil? &&
    @macd_signal.sell?
  end

  def open_buy_trade?
    @open_trade.nil? &&
    !@psar_signal.nil? &&
    @psar_signal.buy? &&
    !@exponential_moving_average_signal.nil? &&
    @exponential_moving_average_signal.buy? &&
    !@macd_signal.nil? &&
    @macd_signal.buy?
  end

  def update_psar_signal(market_state)
    if @psar_signal.nil?
      @psar_signal = get_new_psar_signal(market_state)
    end
  end

  def get_new_psar_signal(market_state)
    signal = nil
    exchange = @indicator_list.exchange_indicator
    psar = @indicator_list.psar_indicator

    if psar.value.nil? || exchange.value.nil?
      return
    end

    if @previous_psar.nil? || @previous_exchange.nil?
      @previous_psar = psar.value
      @previous_exchange = exchange.value

      return
    end

    if @previous_psar < @previous_exchange && psar.value > exchange.value
      signal = TradeSignal.sell market_state
    elsif @previous_psar > @previous_exchange && psar.value < exchange.value
      signal = TradeSignal.buy market_state
    end

    @previous_psar = psar.value
    @previous_exchange = exchange.value

    signal
  end

  def update_exponential_moving_average_signal(market_state)
    exchange = @indicator_list.exchange_indicator
    exponential_moving_average = @indicator_list.exponential_moving_average_indicator

    if exchange.value.nil? || exponential_moving_average.value.nil?
      return
    end

    if exponential_moving_average.value > exchange.value
      @exponential_moving_average_signal = TradeSignal.sell market_state
    else
      @exponential_moving_average_signal = TradeSignal.buy market_state
    end
  end

  def update_macd_signal(market_state)
    if @macd_signal.nil?
      @macd_signal = get_new_macd_signal(market_state)
    end
  end

  def get_new_macd_signal(market_state)
    signal = nil
    macd = @indicator_list.macd_indicator
    macd_signal_line = @indicator_list.macd_signal_line_indicator

    if macd.value.nil? || macd_signal_line.value.nil?
      return
    end

    if @previous_macd.nil? || @previous_macd_signal.nil?
      @previous_macd = macd.value
      @previous_macd_signal = macd_signal_line.value

      return
    end

    if @previous_macd < @previous_macd_signal && macd.value > macd_signal_line.value
      signal = TradeSignal.buy market_state
    elsif @previous_macd > @previous_macd_signal && macd.value < macd_signal_line.value
      signal = TradeSignal.sell market_state
    end

    @previous_macd = macd.value
    @previous_macd_signal = macd_signal_line.value

    signal
  end
end