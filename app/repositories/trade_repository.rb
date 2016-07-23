class TradeRepository
  def find_all(strategy_id)
    TradeTable.with(collection: strategy_id, database: "test_database").all
  end

  def paginate(strategy_id, page, limit)
    TradeTable.with(collection: strategy_id, database: "test_database").skip(page * limit).limit(limit)
  end

  def count(strategy_id)
    TradeTable.with(collection: strategy_id, database: "test_database").count
  end

  def find_by_id(strategy_id, id)
    TradeTable.with(collection: strategy_id, database: "test_database").find(id)
  end

  def store(strategy_id, table)
    table.with(collection: strategy_id, database: "test_database").save
  end
end