class TradeHandlerBuilder
  def get
    trade_id_generator = TradeIdGenerator.new

    open_trade_list = TradeList.new

    trade_mapper_builder = TradeQueueMapperBuilder.new
    trade_mapper = trade_mapper_builder.get

    TradeHandler.new(
        trade_id_generator,
        open_trade_list,
        trade_mapper
    )
  end
end