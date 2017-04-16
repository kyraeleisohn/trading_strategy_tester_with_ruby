class PsarIndicatorBuilder < DomainBuilder
  def get_seconds(tick_count)
    chart_builder = ChartBuilder.new tick_count
    chart = chart_builder.get 'PSAR'

    lowest_value_indicator_builder = LowestValueIndicatorBuilder.new
    lowest_value_indicator = lowest_value_indicator_builder.get(tick_count)

    highest_value_indicator_builder = HighestValueIndicatorBuilder.new
    highest_value_indicator = highest_value_indicator_builder.get(tick_count)

    time_filter = TimeFilter.new('second', 1)

    PsarIndicator.new(
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

  def get_minutes(tick_count)
    chart_builder = ChartBuilder.new tick_count
    chart = chart_builder.get 'PSAR'

    lowest_value_indicator_builder = LowestValueIndicatorBuilder.new
    lowest_value_indicator = lowest_value_indicator_builder.get(tick_count)

    highest_value_indicator_builder = HighestValueIndicatorBuilder.new
    highest_value_indicator = highest_value_indicator_builder.get(tick_count)

    time_filter = TimeFilter.new('minute', 1)

    PsarIndicator.new(
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
end