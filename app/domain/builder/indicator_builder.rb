class IndicatorBuilder < DomainBuilder
  def get(tick_count)
    chart_builder = ChartBuilder.new tick_count
    chart = chart_builder.get 'indicator'

    Indicator.new(
      generate_id,
      chart
    )
  end
end