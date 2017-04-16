class LowestValueIndicator < Indicator
  def enforce(market_state)

    if @value.nil?
      @value = market_state.bid_price
    end

    if @value > market_state.bid_price
      @value = market_state.bid_price
    end

    @chart.add(
        market_state.date_time,
        {
            'value' => @value
        }
    )
  end

  def reset
    @value = nil
  end

  def value
    @value
  end
end