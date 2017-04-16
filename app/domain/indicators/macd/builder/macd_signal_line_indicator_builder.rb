class MacdSignalLineIndicatorBuilder < DomainBuilder
  def get_seconds(tick_count)
    chart_builder = ChartBuilder.new tick_count
    chart = chart_builder.get 'MACDSLSECONDS'

    macd_indicator_builder = MacdIndicatorBuilder.new

    time_filter = TimeFilter.new('second', 1)
    item_list = TimeFilteredFixedSizeArray.new(9, time_filter)

    MacdSignalLineIndicator.new(
      generate_id,
      chart,
      macd_indicator_builder.get_seconds(tick_count),
      item_list
    )
  end

  def get_minutes(tick_count)
    chart_builder = ChartBuilder.new tick_count
    chart = chart_builder.get 'MACDSLMINUTES'

    macd_indicator_builder = MacdIndicatorBuilder.new

    time_filter = TimeFilter.new('minute', 1)
    item_list = TimeFilteredFixedSizeArray.new(9, time_filter)

    MacdSignalLineIndicator.new(
        generate_id,
        chart,
        macd_indicator_builder.get_seconds(tick_count),
        item_list
    )
  end
end