class IndicatorModel
  def initialize(mapper)
    @mapper = mapper
  end

  protected
  def get_as_array(domain)
    {
        :id => domain.id,
        :chart_id => domain.chart.id,
    }
  end
end