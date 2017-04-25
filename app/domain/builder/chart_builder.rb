class ChartBuilder < DomainBuilder
  def get(name)
    Chart.new(
      generate_id,
      TimeFilter.new('minute', 1),
      [],
      name
    )
  end
end