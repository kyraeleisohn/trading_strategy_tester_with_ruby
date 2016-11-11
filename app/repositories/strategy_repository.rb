class StrategyRepository
  def find_all
    StrategyTable.all
  end

  def paginate(page, limit)
    StrategyTable.skip(page * limit).limit(limit)
  end

  def count
    StrategyTable.count
  end

  def find_by_id(id)
    StrategyTable.find(id)
  end

  def store(table)
    table.upsert
  end
end