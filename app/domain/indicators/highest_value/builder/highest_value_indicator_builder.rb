class HighestValueIndicatorBuilder < DomainBuilder
  def get(tick_count)
    name = 'HIGHESTVALUE'
    chart_builder = ChartBuilder.new tick_count
    chart = chart_builder.get name

    HighestValueIndicator.new(
        generate_id,
        chart
    )
  end
end