
class StrategyBuilder < DomainBuilder
  def initialize(tick_count)
    @tick_count = tick_count
  end

  def get(parameter_list)
    trade_handler_builder = TradeHandlerBuilder.new
    trade_handler = trade_handler_builder.get

    chart_builder = ChartBuilder.new @tick_count
    chart = chart_builder.get

    Strategy.new(
      generate_id,
      'random',
      parameter_list,
      trade_handler,
      chart
    )
  end
end