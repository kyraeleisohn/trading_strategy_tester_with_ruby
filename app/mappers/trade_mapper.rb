class TradeMapper < Mapper
  def initialize(repository, market_state_mapper, trade_factory)
    @repository = repository
    @market_state_mapper = market_state_mapper
    @trade_factory = trade_factory
  end

  def find_by_id(strategy_id, id)
    table = @repository.find_by_id(strategy_id, id)

    from_table(strategy_id, table)
  end

  def find_all(strategy_id)
    table_list = @repository.find_all(strategy_id)
    
    table_list.collect { |table| from_table(strategy_id, table) }
  end

  def paginate(strategy_id, page, limit)
    table_list =  @repository.paginate(strategy_id, page, limit)

    table_list.collect { |table| from_table(strategy_id, table) }
  end

  def count(strategy_id)
    @repository.count(strategy_id)
  end

  def store(trade)
    @repository.store(trade.strategy_id, to_table(trade))
  end

  private
  def to_table(trade)
    opening_state = @market_state_mapper.to_table(trade.opening_state)
    closing_state = @market_state_mapper.to_table(trade.closing_state)
    TradeTable.new(
        id: trade.id,
        type: trade.is_buy,
        opening_state: opening_state,
        closing_state: closing_state
    )
  end

  def from_table(strategy_id, table)
    @trade_factory.get(
        strategy_id,
        table.id,
        table.type,
        @market_state_mapper.from_table(table.opening_state),
        @market_state_mapper.from_table(table.closing_state)
    )
  end
end