class StrategyModelMapper
  def map(strategy)
    ShowStrategyModel.new(
      strategy.id,
      strategy.name,
      strategy.parameter_list,
      strategy.chart.id,
      strategy.indicator_list.id
    )
  end

  def map_multiple(strategies)
    IndexStrategyModel.new(strategies.collect {|strategy| map(strategy)})
  end
end