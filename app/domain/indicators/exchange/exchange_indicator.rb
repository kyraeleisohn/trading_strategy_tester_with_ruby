class ExchangeIndicator < Indicator
  attr_accessor :id, :chart

  def initialize(id, chart)
    @id = id
    @chart = chart
  end

  def enforce(market_state)
    @value = market_state.ask_price

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