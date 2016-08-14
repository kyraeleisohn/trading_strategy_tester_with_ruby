class ExchangeStatusModel
  def initialize(mapper)
    @mapper = mapper
  end

  protected
  def get_as_array(exchange_status)
    {
      id: exchange_status.id,
      cycle_maximum: exchange_status.cycle_maximum,
      finished_cycles: exchange_status.finished_cycles,
      status: exchange_status.status,
      time_spent: exchange_status.time_spent
    }
  end
end