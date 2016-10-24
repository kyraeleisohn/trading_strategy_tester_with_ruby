class TradeQueueMapper < Mapper
  def initialize(repository, market_state_mapper, trade_factory)
    @repository = repository
    @market_state_mapper = market_state_mapper
    @trade_factory = trade_factory
  end

  def paginate(page, limit)
    table_list =  @repository.paginate(page, limit)

    table_list.collect { |table| from_table(table) }
  end

  def count
    @repository.count
  end

  def store(trade)
    @repository.store(to_table(trade))
  end

  def remove(trade)
    @repository.delete trade.id
  end

  private
  def to_table(trade)
    opening_state = @market_state_mapper.to_table(trade.opening_state)
    closing_state = @market_state_mapper.to_table(trade.closing_state)
    TradeTable.new(
        id: trade.id,
        strategy_id: trade.strategy_id,
        type: trade.is_buy,
        opening_state: opening_state,
        closing_state: closing_state
    )
  end

  def from_table(table)
    @trade_factory.get(
        table.id,
        table.strategy_id,
        table.type,
        @market_state_mapper.from_table(table.opening_state),
        @market_state_mapper.from_table(table.closing_state)
    )
  end
end