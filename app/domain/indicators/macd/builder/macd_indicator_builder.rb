class MacdIndicatorBuilder < DomainBuilder
  def get_seconds
    chart_builder = ChartBuilder.new
    chart = chart_builder.get 'MACDSECONDS'

    exponential_moving_average_builder = ExponentialMovingAverageIndicatorBuilder.new

    MacdIndicator.new(
      generate_id,
      chart,
      exponential_moving_average_builder.get_12_seconds,
      exponential_moving_average_builder.get_26_seconds
    )
  end

  def get_minutes
    chart_builder = ChartBuilder.new
    chart = chart_builder.get 'MACDMINUTES'

    exponential_moving_average_builder = ExponentialMovingAverageIndicatorBuilder.new

    MacdIndicator.new(
        generate_id,
        chart,
        exponential_moving_average_builder.get_12_minutes,
        exponential_moving_average_builder.get_26_minutes
    )
  end
end