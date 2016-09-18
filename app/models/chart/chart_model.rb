class ChartModel
  def initialize(mapper)
    @mapper = mapper
  end

  protected
  def get_as_array(chart)
    {
        :id => chart.id,
        :data => chart.data
    }
  end
end