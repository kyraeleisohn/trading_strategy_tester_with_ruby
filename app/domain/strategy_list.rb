
class StrategyList < Array
  def enforce(market_state)
    each do |strategy|
      strategy.tick market_state
    end
  end
end