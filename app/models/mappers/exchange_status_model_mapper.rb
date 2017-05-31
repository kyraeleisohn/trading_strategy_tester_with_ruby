class ExchangeStatusModelMapper
  def map(exchange_status)
    ShowExchangeStatusModel.new(
        exchange_status.id,
        exchange_status.cycle_maximum,
        exchange_status.finished_cycles,
        exchange_status.status,
        exchange_status.time_spent
    )
  end

  def map_multiple(exchange_status_list)
    IndexExchangeStatusModel.new(exchange_status_list.collect {|exchange_status| map(exchange_status)})
  end
end