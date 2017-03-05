class EfficiencyRatioIndicatorBuilder < DomainBuilder
  def get_100_seconds(tick_count)
    chart_builder = ChartBuilder.new tick_count
    chart = chart_builder.get 'ER100SECONDS'

    time_filter = TimeFilter.new('second', 1)
    item_list = TimeFilteredFixedSizeArray.new(100, time_filter)

    EfficiencyRatioIndicator.new(
      generate_id,
      chart,
      item_list
    )
  end
end