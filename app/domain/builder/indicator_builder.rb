class IndicatorBuilder < DomainBuilder
  def get
    chart_builder = ChartBuilder.new
    chart = chart_builder.get 'indicator'

    Indicator.new(
      generate_id,
      chart
    )
  end
end