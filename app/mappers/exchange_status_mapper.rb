class ExchangeStatusMapper < Mapper
  def initialize(repository, search_request_mapper)
    @repository = repository
    @search_request_mapper = search_request_mapper
  end

  def find(search_request)
    table_list = @repository.find(@search_request_mapper.get_as_filter(search_request))
    
    table_list.collect { |table| from_table table }
  end

  def store(exchange_status)
    @repository.store(to_table(exchange_status))
  end

  private
  def to_table(exchange_status)
    ExchangeStatusTable.new(
      id: exchange_status.id,
      cycle_maximum: exchange_status.cycle_maximum,
      finished_cycles: exchange_status.finished_cycles,
      status: exchange_status.status,
      time_spent: exchange_status.time_spent
    )
  end

  def from_table(table)
    ExchangeStatus.new(
      table.id,
      table.cycle_maximum,
      table.finished_cycles,
      table.time_spent,
      table.status
    )
  end
end