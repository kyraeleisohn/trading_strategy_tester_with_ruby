class TradeModelMapper
  def map(trade)
    ShowTradeModel.new(
      trade.id,
      trade.is_buy,
      trade.final_profit,
      trade.opening_date_time,
      trade.closing_date_time,
      trade.opening_price,
      trade.closing_price,
      trade.opening_state,
      trade.closing_state,
    )
  end

  def map_multiple(trades)
    IndexTradeModel.new(trades.collect {|trade| map(trade)})
  end
end