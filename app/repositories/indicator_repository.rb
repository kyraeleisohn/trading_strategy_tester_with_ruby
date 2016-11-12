class IndicatorRepository
  def find_by_id(id)
    IndicatorTable.find id
  end

  def store(table)
    table.upsert
  end
end