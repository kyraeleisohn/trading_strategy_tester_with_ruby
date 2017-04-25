class TradeModel
  def initialize(mapper)
    @mapper = mapper
  end

  protected
  def get_trade_as_array(trade)
    {
        :type               => trade.is_buy ? 'buy' : 'sell',
        :profit             => trade.final_profit,
        :opening_date_time  => trade.opening_date_time,
        :closing_date_time  => trade.closing_date_time,
        :opening_price      => trade.opening_price,
        :closing_price      => trade.closing_price,
        :opening_ask_volume => trade.opening_state.ask_volume,
        :closing_ask_volume => trade.closing_state.ask_volume,
    }
  end
end