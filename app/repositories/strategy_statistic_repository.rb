class StrategyStatisticRepository
  def find_all
    StrategyStatisticTable.all
  end

  def paginate(page, limit)
    StrategyStatisticTable.skip(page * limit).limit(limit).order_by(:profit => 'desc')
  end

  def count
    StrategyStatisticTable.count
  end

  def find_by_id(id)
    StrategyStatisticTable.find(id)
  end

  def save(table)
    table.upsert
  end
end