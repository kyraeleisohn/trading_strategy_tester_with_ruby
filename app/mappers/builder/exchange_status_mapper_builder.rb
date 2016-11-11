class ExchangeStatusMapperBuilder < MapperBuilder
  def get
    ExchangeStatusMapper.new(
      ExchangeStatusRepository.new,
      ExchangeStatusSearchRequestMapper.new
    )
  end
end