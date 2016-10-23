class TradeQueueMapperBuilder
  def get
    TradeQueueMapper.new(
        TradeQueueRepository.new,
        MarketStateMapper.new,
        TradeFactory.new
    )
  end
end