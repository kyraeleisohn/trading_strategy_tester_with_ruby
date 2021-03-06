class ChartMapper < Mapper
  def initialize(repository)
    @repository = repository
  end

  def store(chart)
    @repository.store(to_table(chart))
  end

  def find_by_id(id)
    from_table(@repository.find_by_id(id))
  end

  private
  def to_table(chart)
    ChartTable.new(
      id: chart.id,
      data: chart.data,
      name: chart.name
    )
  end

  def from_table(table)
    Chart.new(
      table.id,
      TimeFilter.new('minute', 1),
      table.data,
      table.name
    )
  end
end