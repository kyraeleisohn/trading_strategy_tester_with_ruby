class MacdIndicatorBuilder < DomainBuilder
  def get_seconds(tick_count)
    chart_builder = ChartBuilder.new tick_count
    chart = chart_builder.get 'MACDSECONDS'

    exponential_moving_average_builder = ExponentialMovingAverageIndicatorBuilder.new

    MacdIndicator.new(
      generate_id,
      chart,
      exponential_moving_average_builder.get_12_seconds(tick_count),
      exponential_moving_average_builder.get_26_seconds(tick_count)
    )
  end
end