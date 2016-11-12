class StrategyMapperBuilder
  def get
    chart_mapper_builder = ChartMapperBuilder.new
    chart_mapper = chart_mapper_builder.get

    trade_handler_mapper_builder = TradeHandlerMapperBuilder.new
    trade_handler_mapper = trade_handler_mapper_builder.get

    indicator_mapper_builder = IndicatorMapperBuilder.new
    indicator_mapper = indicator_mapper_builder.get

    StrategyMapper.new(
      StrategyRepository.new,
      chart_mapper,
      trade_handler_mapper,
      indicator_mapper
    )
  end
end