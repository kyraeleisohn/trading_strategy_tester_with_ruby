class MovingAverageIndicator
  attr_accessor :id, :chart

  def initialize(id, chart, unit_type, unit_count)
    @id = id
    @chart = chart
    @time_filter = TimeFilter.new(unit_type, 1)
    @unit_count = unit_count
    @items = Array.new
  end

  def enforce(market_state)
    if @time_filter.changed market_state.date_time
      @items.push market_state.ask_price
      if @items.count > @unit_count
        @items = @items[-1 * @unit_count, @unit_count]
      end
    end

    @chart.add(
        market_state.date_time,
        {
            'value' => value
        }
    )
  end

  def value
    if @items.count < @unit_count
      return nil
    end

    @items.inject{ |sum, value| sum + value }.to_f / @items.size
  end
end