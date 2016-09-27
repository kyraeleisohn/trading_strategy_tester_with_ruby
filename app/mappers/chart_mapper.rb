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
      mod: chart.mod,
      data: chart.data
    )
  end

  def from_table(table)
    chart = Chart.new(
      table.mod,
      table.data
    )

    chart.assign table.id

    chart
  end
end