class Indicator
  attr_accessor :id, :chart

  def initialize(id, chart)
    @id = id
    @chart = chart
  end

  def enforce(market_state)
  end

  def value
    nil
  end

  def get_chart_id
    @chart.id
  end
end