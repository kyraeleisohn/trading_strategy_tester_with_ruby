class ExchangeIndicatorBuilder < DomainBuilder
  def get
    chart_builder = ChartBuilder.new
    chart = chart_builder.get 'Market'

    time_filter = TimeFilter.new('minute', 1)

    ExchangeIndicator.new(
      generate_id,
      chart,
      time_filter
    )
  end
end