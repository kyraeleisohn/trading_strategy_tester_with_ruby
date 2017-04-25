class HighestValueIndicatorBuilder < DomainBuilder
  def get
    name = 'HIGHESTVALUE'
    chart_builder = ChartBuilder.new
    chart = chart_builder.get name

    HighestValueIndicator.new(
        generate_id,
        chart
    )
  end
end