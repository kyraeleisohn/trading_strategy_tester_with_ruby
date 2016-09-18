
class SellTrade < Trade
  def is_sell
    true
  end

  def profit market_state
    @opening_state.ask_price.to_f - market_state.bid_price.to_f
  end
end