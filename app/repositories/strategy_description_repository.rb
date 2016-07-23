class StrategyDescriptionRepository
  def find_all
    StrategyDescriptionTable.all
  end

  def paginate(page, limit)
    StrategyDescriptionTable.skip(page * limit).limit(limit)
  end

  def count
    StrategyDescriptionTable.count
  end

  def find_by_id(id)
    StrategyDescriptionTable.find(id)
  end

  def create(table)
    table.save
  end
end