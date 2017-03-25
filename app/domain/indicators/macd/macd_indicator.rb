class MacdIndicator < Indicator
  def initialize(
      id,
      chart,
      twelve_unit_exponential_moving_average,
      twenty_six_unit_exponential_moving_average
  )
    super(id, chart)
    @twelve_unit_exponential_moving_average = twelve_unit_exponential_moving_average
    @twenty_six_unit_exponential_moving_average = twenty_six_unit_exponential_moving_average
  end

  def enforce(market_state)
    @twelve_unit_exponential_moving_average.enforce market_state
    @twenty_six_unit_exponential_moving_average.enforce market_state

    @twelve_unit_exponential_moving_average_value = @twelve_unit_exponential_moving_average.value
    @twenty_six_unit_exponential_moving_average_value = @twenty_six_unit_exponential_moving_average.value

    unless @twelve_unit_exponential_moving_average_value.nil? || @twenty_six_unit_exponential_moving_average_value.nil?
      @value = @twelve_unit_exponential_moving_average_value - @twenty_six_unit_exponential_moving_average_value
    else
      @value = nil
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