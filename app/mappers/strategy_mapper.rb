class StrategyMapper < Mapper
  def initialize(repository, chart_mapper, trade_handler_builder)
    @repository = repository
    @chart_mapper = chart_mapper
    @trade_handler_builder = trade_handler_builder
  end

  def find_by_id(id)
    table = @repository.find_by_id(id)

    from_table(table)
  end

  def find_all
    table_list = @repository.find_all

    table_list.collect { |table| from_table(table) }
  end

  def paginate(page, limit)
    table_list =  @repository.paginate(page, limit)

    table_list.collect { |table| from_table(table) }
  end

  def count
    @repository.count
  end

  def store(domain)
    @repository.store(to_table(domain))
    @chart_mapper.store domain.chart
    @trade_handler_builder.store domain.trade_handler
  end

  private
  def to_table(domain)
    StrategyTable.new(
      id: domain.id,
      name: domain.name,
      parameter_list: domain.parameter_list,
      chart_id: domain.chart.id,
      trade_handler_id: domain.trade_handler.id
    )
  end

  def from_table(table)

    trade_handler = @trade_handler_builder.find_by_id table.trade_handler_id
    chart = @chart_mapper.find_by_id table.chart_id

    Strategy.new(
      table.id,
      table.name,
      table.parameter_list,
      trade_handler,
      chart
    )
  end
end