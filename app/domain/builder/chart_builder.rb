class ChartBuilder < DomainBuilder
  CHART_RESOLUTION = 100

  def initialize(tick_count)
    @tick_count = tick_count
  end

  def get(name)
    Chart.new(
      generate_id,
      get_chart_mod,
      [],
      name
    )
  end

  private
  def get_chart_mod
    (@tick_count.to_f / CHART_RESOLUTION.to_f).floor
  end
end