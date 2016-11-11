class TradeMapperBuilder < MapperBuilder
  def get
    TradeMapper.new(
        TradeRepository.new,
        MarketStateMapper.new,
        TradeFactory.new
    )
  end
end