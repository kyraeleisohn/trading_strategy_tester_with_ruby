class TradeHandlerMapper < Mapper
  def initialize(repository)
    @repository = repository
  end

  def store(domain)
    @repository.store(to_table(domain))
  end

  def find_by_id(id)
    from_table(@repository.find_by_id(id))
  end

  private
  def to_table(domain)
    TradeHandlerTable.new(
      id: domain.id
    )
  end

  def from_table(table)
    trade_mapper_builder = TradeMapperBuilder.new

    TradeHandler.new(
      table.id,
      IdGenerator.new,
      TradeList.new,
      trade_mapper_builder.get
    )
  end
end