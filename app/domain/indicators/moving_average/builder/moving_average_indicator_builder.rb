class MovingAverageIndicatorBuilder < DomainBuilder
  def get_100_seconds(tick_count)
    chart_builder = ChartBuilder.new tick_count
    chart = chart_builder.get 'MA100SECONDS'

    MovingAverageIndicator.new(
      generate_id,
      chart,
      'second',
      100
    )
  end
end