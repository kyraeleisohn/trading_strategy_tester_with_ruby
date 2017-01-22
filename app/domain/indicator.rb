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
end