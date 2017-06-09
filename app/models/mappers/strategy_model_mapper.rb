class StrategyModelMapper
  def map(strategy)
    ShowStrategyModel.new(
      strategy.id,
      strategy.name,
      strategy.parameter_list,
      strategy.chart.id,
      strategy.get_indicator_chart_id_list
    )
  end

  def map_multiple(strategies)
    IndexStrategyModel.new(strategies.collect {|strategy| map(strategy)})
  end
end