
class MarketStateAwareList < Array
  def enforce(market_state)
    each do |item|
      item.enforce market_state
    end
  end
end