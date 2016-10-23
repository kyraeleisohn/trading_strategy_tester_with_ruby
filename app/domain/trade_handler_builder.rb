class TradeHandlerBuilder
  def get
    trade_id_generator = TradeIdGenerator.new
    open_trade_list = TradeList.new
    closed_trade_list = TradeList.new
    summary_converter = SummaryConverter.new
    statistic_generator = StatisticGenerator.new(summary_converter)
    statistic_repository = StrategyStatisticRepository.new
    statistic_mapper = StrategyStatisticMapper.new(statistic_repository)
    trade_mapper_builder = TradeQueueMapperBuilder.new
    trade_mapper = trade_mapper_builder.get
    TradeHandler.new(
        trade_id_generator,
        open_trade_list,
        closed_trade_list,
        statistic_generator,
        statistic_mapper,
        trade_mapper
    )
  end
end