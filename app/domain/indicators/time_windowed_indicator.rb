class TimeWindowedIndicator < Indicator
  attr_accessor :id, :chart

  def initialize(id, chart, items)
    @id = id
    @chart = chart
    @items = items
  end

  def enforce(market_state)
    @items.push(market_state.ask_price, market_state.date_time)

    @chart.add(
        market_state.date_time,
        {
            'value' => value
        }
    )
  end

  def value
    nil
  end
end