class HighestValueIndicatorBuilder < DomainBuilder
  def get_100_seconds(tick_count)
    chart_builder = ChartBuilder.new tick_count
    chart = chart_builder.get 'HIGHESTVALUE100SECONDS'

    time_filter = TimeFilter.new('second', 1)
    item_list = TimeFilteredFixedSizeArray.new(100, time_filter)

    HighestValueIndicator.new(
      generate_id,
      chart,
      item_list
    )
  end


  def get_10_minutes(tick_count)
    chart_builder = ChartBuilder.new tick_count
    chart = chart_builder.get 'HIGHESTVALUE10MINUTES'

    time_filter = TimeFilter.new('minute', 1)
    item_list = TimeFilteredFixedSizeArray.new(100, time_filter)

    HighestValueIndicator.new(
        generate_id,
        chart,
        item_list
    )
  end
end