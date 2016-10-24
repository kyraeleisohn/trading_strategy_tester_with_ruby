class StrategySummaryRepository
  def find(filter_list)
    StrategySummaryTable.where filter_list
  end

  def save(table)
    table.upsert
  end

  def paginate(page, limit)
    StrategySummaryTable.skip(page * limit).limit(limit)
  end

  def count
    StrategySummaryTable.count
  end
end