class TradeModel
  def initialize(mapper)
    @mapper = mapper
  end

  protected
  def get_trade_as_array(trade)
    {
        :type                     => trade.is_buy ? 'buy' : 'sell',
        :opening_state_date_time  => trade.opening_state.date_time,
        :closing_state_date_time  => trade.closing_state.date_time,
        :opening_state_ask_price  => trade.opening_state.ask_price,
        :closing_state_ask_price  => trade.closing_state.ask_price,
        :opening_state_ask_volume => trade.opening_state.ask_volume,
        :closing_state_ask_volume => trade.closing_state.ask_volume,
    }
  end
end