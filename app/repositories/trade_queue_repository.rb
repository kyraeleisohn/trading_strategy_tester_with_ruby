class TradeQueueRepository
  TRADE_QUEUE_COLLECTION = 'trade_queue'
  def find_all
    TradeTable.with(collection: TRADE_QUEUE_COLLECTION, database: "test_database").all
  end

  def paginate(page, limit)
    TradeTable.with(collection: TRADE_QUEUE_COLLECTION, database: "test_database").skip(page * limit).limit(limit)
  end

  def count
    TradeTable.with(collection: TRADE_QUEUE_COLLECTION, database: "test_database").count
  end

  def find_by_id(id)
    TradeTable.with(collection: TRADE_QUEUE_COLLECTION, database: "test_database").find(id)
  end

  def store(table)
    table.with(collection: TRADE_QUEUE_COLLECTION, database: "test_database").save
  end
end