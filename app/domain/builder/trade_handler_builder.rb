class TradeHandlerBuilder < DomainBuilder
  def get
    id_generator = IdGenerator.new

    open_trade_list = TradeList.new

    trade_mapper_builder = TradeQueueMapperBuilder.new
    trade_mapper = trade_mapper_builder.get

    TradeHandler.new(
        id_generator,
        open_trade_list,
        trade_mapper
    )
  end
end