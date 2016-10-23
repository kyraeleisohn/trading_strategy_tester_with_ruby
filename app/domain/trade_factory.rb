class TradeFactory
  def get(id, strategy_id, type, opening_state, closing_state)
    case type
      when "buy"
        trade = BuyTrade.new(strategy_id, id, opening_state)
      when "sell"
        trade = SellTrade.new(strategy_id, id, opening_state)
      else
        trade = Trade.new(strategy_id, id, opening_state)
    end

    trade.closing_state = closing_state

    trade
  end
end