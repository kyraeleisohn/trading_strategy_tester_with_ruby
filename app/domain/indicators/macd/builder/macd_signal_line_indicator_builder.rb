class MacdSignalLineIndicatorBuilder < DomainBuilder
  def get_seconds
    chart_builder = ChartBuilder.new
    chart = chart_builder.get 'MACDSLSECONDS'

    macd_indicator_builder = MacdIndicatorBuilder.new

    time_filter = TimeFilter.new('second', 1)
    item_list = TimeFilteredFixedSizeArray.new(9, time_filter)

    MacdSignalLineIndicator.new(
      generate_id,
      chart,
      macd_indicator_builder.get_seconds,
      item_list
    )
  end

  def get_minutes
    chart_builder = ChartBuilder.new
    chart = chart_builder.get 'MACDSLMINUTES'

    macd_indicator_builder = MacdIndicatorBuilder.new

    time_filter = TimeFilter.new('minute', 1)
    item_list = TimeFilteredFixedSizeArray.new(9, time_filter)

    MacdSignalLineIndicator.new(
        generate_id,
        chart,
        macd_indicator_builder.get_minutes,
        item_list
    )
  end
end