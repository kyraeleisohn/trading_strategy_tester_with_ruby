class TradeQueueProcessorBuilder
  def get
    trade_queue_mapper_builder = TradeQueueMapperBuilder.new
    trade_queue_mapper = trade_queue_mapper_builder.get

    strategy_summary_mapper_builder = StrategySummaryMapperBuilder.new
    strategy_summary_mapper = strategy_summary_mapper_builder.get

    TradeQueueProcessor.new(
        trade_queue_mapper,
        strategy_summary_mapper
    )
  end
end