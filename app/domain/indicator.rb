class Indicator
  attr_accessor :id, :chart

  def initialize(id, chart)
    @id = id
    @chart = chart
  end

  def enforce(market_state)
    @chart.add(
      market_state.date_time,
      {
       'plus_ten' => market_state.ask_price * 1.1,
       'minus_ten' => market_state.ask_price * 0.9,
      }
    )
  end
end