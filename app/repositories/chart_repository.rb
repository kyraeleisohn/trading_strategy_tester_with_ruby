class ChartRepository
  def find_by_id(id)
    ChartTable.find id
  end

  def store(table)
    table.upsert
  end
end