class StrategyModel
  def initialize(mapper)
    @mapper = mapper
  end

  protected
  def get_as_array(strategy)
    {
        :id => strategy.id,
        :name => strategy.name,
        :parameter_list => strategy.parameter_list,
        :chart_id => strategy.chart.id,
        :indicator_list_id => strategy.indicator_list.id
    }
  end
end