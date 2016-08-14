class ExchangeStatusMapperBuilder
  def get
    exchange_status_repository = ExchangeStatusRepository.new
    exchange_status_search_request_mapper = ExchangeStatusSearchRequestMapper.new

    ExchangeStatusMapper.new(
        exchange_status_repository,
        exchange_status_search_request_mapper
    )
  end
end