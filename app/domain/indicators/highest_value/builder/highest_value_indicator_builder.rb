class HighestValueIndicatorBuilder < DomainBuilder
  def get_100_seconds(tick_count)
    time_filter = TimeFilter.new('second', 1)
    item_list = TimeFilteredFixedSizeArray.new(100, time_filter)

    get('HIGHESTVALUE100SECONDS', tick_count, item_list)
  end


  def get_10_minutes(tick_count)
    time_filter = TimeFilter.new('minute', 1)
    item_list = TimeFilteredFixedSizeArray.new(10, time_filter)

    get('HIGHESTVALUE10MINUTES', tick_count, item_list)
  end

  def get_100_minutes(tick_count)
    time_filter = TimeFilter.new('minute', 1)
    item_list = TimeFilteredFixedSizeArray.new(100, time_filter)

    get('HIGHESTVALUE100MINUTES', tick_count, item_list)
  end

  def get(name, tick_count, item_list)
    chart_builder = ChartBuilder.new tick_count
    chart = chart_builder.get name

    HighestValueIndicator.new(
        generate_id,
        chart,
        item_list
    )
  end
end