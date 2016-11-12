class IndicatorMapper < Mapper
  def initialize(repository, chart_mapper)
    @repository = repository
    @chart_mapper = chart_mapper
  end

  def store(domain)
    @repository.store(to_table(domain))
    @chart_mapper.store domain.chart
  end

  def find_by_id(id)
    from_table(@repository.find_by_id(id))
  end

  private
  def to_table(domain)
    IndicatorTable.new(
      id: domain.id,
      chart_id: domain.chart.id
    )
  end

  def from_table(table)
    chart = @chart_mapper.find_by_id table.chart_id

    Indicator.new(
      table.id,
      chart
    )
  end
end