class MacdSignalLineIndicator < Indicator
  def initialize(
      id,
      chart,
      macd_indicator,
      items
  )
    super(id, chart)
    @macd_indicator = macd_indicator
    @items = items
  end

  def enforce(market_state)
    @macd_indicator.enforce market_state

    if @macd_indicator.value.nil?
      @value = nil
    else
      @items.push(@macd_indicator.value, market_state.date_time)

      if @items.filled?
        @value = @items.exponential_moving_average
      end
    end

    @chart.add(
        market_state.date_time,
        {
            'value' => @value,
        }
    )
  end

  def value
    @value
  end
end