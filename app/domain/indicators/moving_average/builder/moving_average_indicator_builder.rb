class MovingAverageIndicatorBuilder < DomainBuilder
  def get_100_seconds
    chart_builder = ChartBuilder.new
    chart = chart_builder.get 'MA100SECONDS'

    time_filter = TimeFilter.new('second', 1)
    item_list = TimeFilteredFixedSizeArray.new(100, time_filter)

    MovingAverageIndicator.new(
      generate_id,
      chart,
      item_list
    )
  end
end