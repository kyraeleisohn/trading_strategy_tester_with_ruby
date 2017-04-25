class PsarIndicatorBuilder < DomainBuilder
  def get_seconds
    chart_builder = ChartBuilder.new
    chart = chart_builder.get 'PSAR'

    lowest_value_indicator_builder = LowestValueIndicatorBuilder.new
    lowest_value_indicator = lowest_value_indicator_builder.get

    highest_value_indicator_builder = HighestValueIndicatorBuilder.new
    highest_value_indicator = highest_value_indicator_builder.get

    time_filter = TimeFilter.new('second', 1)

    Psar2Indicator.new(
        generate_id,
        chart,
        time_filter,
        0.02,
        0.19,
        0.2,
        0.02,
        lowest_value_indicator,
        highest_value_indicator
    )
  end

  def get_minutes
    chart_builder = ChartBuilder.new
    chart = chart_builder.get 'PSAR'

    lowest_value_indicator_builder = LowestValueIndicatorBuilder.new
    lowest_value_indicator = lowest_value_indicator_builder.get

    highest_value_indicator_builder = HighestValueIndicatorBuilder.new
    highest_value_indicator = highest_value_indicator_builder.get

    time_filter = TimeFilter.new('minute', 1)

    Psar2Indicator.new(
        generate_id,
        chart,
        time_filter,
        0.02,
        0.39,
        0.4,
        0.02,
        lowest_value_indicator,
        highest_value_indicator
    )
  end
end