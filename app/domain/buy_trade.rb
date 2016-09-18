
class BuyTrade < Trade
  def is_buy
    true
  end

  def profit market_state
    market_state.bid_price.to_f - @opening_state.ask_price.to_f
  end
end