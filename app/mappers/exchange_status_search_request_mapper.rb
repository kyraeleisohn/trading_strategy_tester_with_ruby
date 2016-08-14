class ExchangeStatusSearchRequestMapper < Mapper
  def get_as_filter(exchange_status_search_request)
    if exchange_status_search_request.only_processing then
      [:status => 'processing']
    end
  end
end