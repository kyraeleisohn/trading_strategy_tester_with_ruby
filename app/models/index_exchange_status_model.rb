class IndexExchangeStatusModel < Model
  def initialize(exchange_status_list)
    @exchange_status_list = exchange_status_list
  end

  def to_hash
    {
      data: @exchange_status_list.collect {|exchange_status| exchange_status.to_hash}
    }
  end
end