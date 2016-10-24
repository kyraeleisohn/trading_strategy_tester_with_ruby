class ExchangeStatusRepository
  def find(filter_list)
    ExchangeStatusTable.where filter_list
  end

  def count
    ExchangeStatusTable.count
  end

  def find_by_id(id)
    ExchangeStatusTable.find id
  end

  def store(table)
    table.upsert
  end
end