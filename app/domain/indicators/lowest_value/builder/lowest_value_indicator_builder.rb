class LowestValueIndicatorBuilder < DomainBuilder
  def get
    name = 'LOWESTVALUE'
    chart_builder = ChartBuilder.new
    chart = chart_builder.get name

    LowestValueIndicator.new(
        generate_id,
        chart
    )
  end
end