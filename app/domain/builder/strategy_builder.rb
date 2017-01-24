
class StrategyBuilder < DomainBuilder
  def initialize(tick_count)
    @tick_count = tick_count
  end

  def get(parameter_list)
    trade_handler_builder = TradeHandlerBuilder.new
    trade_handler = trade_handler_builder.get

    chart_builder = ChartBuilder.new @tick_count
    chart = chart_builder.get 'strategy'

    indicator_list_builder = get_indicator_list_builder
    indicator_list = indicator_list_builder.get @tick_count

    get_strategy(
        generate_id,
        get_name,
        parameter_list,
        trade_handler,
        chart,
        indicator_list
    )
  end

  protected

  def get_strategy(
    id,
    name,
    parameter_list,
    trade_handler,
    chart,
    indicator_list
  )
    Strategy.new(
        id,
        name,
        parameter_list,
        trade_handler,
        chart,
        indicator_list
    )
  end

  def get_name
    'empty'
  end

  def get_indicator_list_builder
    IndicatorListBuilder.new
  end
end