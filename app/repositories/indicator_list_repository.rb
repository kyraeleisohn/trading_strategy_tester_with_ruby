class IndicatorListRepository
  def find_by_id(id)
    IndicatorListTable.find id
  end

  def store(table)
    table.upsert
  end
end