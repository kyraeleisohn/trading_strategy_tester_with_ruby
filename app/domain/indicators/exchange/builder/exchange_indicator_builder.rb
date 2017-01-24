class ExchangeIndicatorBuilder < DomainBuilder
  def get(tick_count)
    chart_builder = ChartBuilder.new tick_count
    chart = chart_builder.get 'Market'

    ExchangeIndicator.new(
      generate_id,
      chart
    )
  end
end