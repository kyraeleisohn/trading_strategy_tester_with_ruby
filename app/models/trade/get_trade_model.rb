class GetTradeModel < TradeModel
  def get(strategy_id, id)
    get_trade_as_array(@mapper.find_by_id(strategy_id, id))
  end
end