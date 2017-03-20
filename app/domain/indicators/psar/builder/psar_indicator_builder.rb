class PsarIndicatorBuilder < DomainBuilder
  def get_100_minutes(tick_count)
    chart_builder = ChartBuilder.new tick_count
    chart = chart_builder.get 'PSAR100MINUTES'

    lowest_value_indicator_buider = LowestValueIndicatorBuilder.new
    lowest_value_indicator = lowest_value_indicator_buider.get_100_minutes(tick_count)

    highest_value_indicator_buider = HighestValueIndicatorBuilder.new
    highest_value_indicator = highest_value_indicator_buider.get_100_minutes(tick_count)

    PsarIndicator.new(
      generate_id,
      chart,
      0.02,
      0.19,
      0.2,
      0.02,
      lowest_value_indicator,
      highest_value_indicator
    )
  end
end