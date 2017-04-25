
class StrategyBuilder < DomainBuilder
  def get(parameter_list)
    trade_handler_builder = TradeHandlerBuilder.new
    trade_handler = trade_handler_builder.get

    chart_builder = ChartBuilder.new
    chart = chart_builder.get 'strategy'

    indicator_list_builder = get_indicator_list_builder
    indicator_list = indicator_list_builder.get

    time_filter = TimeFilter.new('minute', 1)

    get_strategy(
        generate_id,
        get_name,
        parameter_list,
        trade_handler,
        chart,
        indicator_list,
        time_filter
    )
  end

  protected

  def get_strategy(
    id,
    name,
    parameter_list,
    trade_handler,
    chart,
    indicator_list,
    time_filter
  )
    Strategy.new(
        id,
        name,
        parameter_list,
        trade_handler,
        chart,
        indicator_list,
        time_filter
    )
  end

  def get_name
    'empty'
  end

  def get_indicator_list_builder
    IndicatorListBuilder.new
  end
end