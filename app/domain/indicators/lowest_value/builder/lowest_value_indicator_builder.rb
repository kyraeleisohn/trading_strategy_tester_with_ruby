class LowestValueIndicatorBuilder < DomainBuilder
  def get(tick_count)
    name = 'LOWESTVALUE'
    chart_builder = ChartBuilder.new tick_count
    chart = chart_builder.get name

    LowestValueIndicator.new(
        generate_id,
        chart
    )
  end
end