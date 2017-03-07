class PsarIndicatorBuilder < DomainBuilder
  def get_100_seconds(tick_count)
    chart_builder = ChartBuilder.new tick_count
    chart = chart_builder.get 'PSAR100SECONDS'

    lowest_value_indicator_buider = LowestValueIndicatorBuilder.new
    lowest_value_indicator = lowest_value_indicator_buider.get_10_minutes(tick_count)

    highest_value_indicator_buider = LowestValueIndicatorBuilder.new
    highest_value_indicator = highest_value_indicator_buider.get_10_minutes(tick_count)

    PsarIndicator.new(
      generate_id,
      chart,
      0.04,
      0.39,
      0.4,
      0.04,
      lowest_value_indicator,
      highest_value_indicator
    )
  end
end