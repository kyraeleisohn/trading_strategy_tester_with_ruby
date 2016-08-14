class GetAllExchangeStatusModel < ExchangeStatusModel
  def get
    @mapper.find(ExchangeStatusSearchRequest.new).collect {|exchange_status| get_as_array exchange_status}
  end
end