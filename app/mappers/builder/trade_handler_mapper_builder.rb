class TradeHandlerMapperBuilder < MapperBuilder
  def get
    TradeHandlerMapper.new(
      TradeHandlerRepository.new
    )
  end
end