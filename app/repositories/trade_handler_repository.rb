class TradeHandlerRepository
  def find_by_id(id)
    TradeHandlerTable.find id
  end

  def store(table)
    table.upsert
  end
end