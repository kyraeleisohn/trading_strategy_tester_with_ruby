class StrategyListBuilderBuilder
  def get
    trade_handler_builder = TradeHandlerBuilder.new
    parameter_list_builder = StrategyParameterListBuilder.new
    StrategyListBuilder.new(trade_handler_builder, parameter_list_builder)
  end
end