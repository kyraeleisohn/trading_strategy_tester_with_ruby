class TradeServiceBuilder
  def get
    TradeService.new(
      TradeMapperBuilder.new.get,
      TradeModelMapper.new
    )
  end
end