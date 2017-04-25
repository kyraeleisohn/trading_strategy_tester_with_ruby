class ExchangeIndicator < Indicator
  attr_accessor :id, :chart

  def initialize(id, chart, time_filter)
    @id = id
    @chart = chart
    @time_filter = time_filter
  end

  def enforce(market_state)
    @chart.add(
        market_state.date_time,
        {
            'value' => market_state.ask_price,
        }
    )

    unless @time_filter.changed market_state.date_time
      return
    end

    @value = market_state.ask_price
  end

  def value
    @value
  end
end