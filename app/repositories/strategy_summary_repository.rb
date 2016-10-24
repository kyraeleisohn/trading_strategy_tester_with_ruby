class StrategySummaryRepository
  def find(filter_list)
    ExchangeStatusTable.where filter_list
  end

  def save(table)
    table.upsert
  end
end