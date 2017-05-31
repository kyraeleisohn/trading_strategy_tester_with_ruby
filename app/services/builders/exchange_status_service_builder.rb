class ExchangeStatusServiceBuilder
  def get
    ExchangeStatusService.new(
        ExchangeStatusMapperBuilder.new.get,
        ExchangeStatusSearchRequestBuilder.new,
        ExchangeStatusModelMapper.new
    )
  end
end