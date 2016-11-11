class TradeQueueProcessorBuilder < DomainBuilder
  def get
    trade_queue_mapper_builder = TradeQueueMapperBuilder.new
    trade_queue_mapper = trade_queue_mapper_builder.get

    trade_mapper_builder = TradeMapperBuilder.new
    trade_mapper = trade_mapper_builder.get

    strategy_summary_mapper_builder = StrategySummaryMapperBuilder.new
    strategy_summary_mapper = strategy_summary_mapper_builder.get

    TradeQueueProcessor.new(
        trade_queue_mapper,
        trade_mapper,
        strategy_summary_mapper
    )
  end
end