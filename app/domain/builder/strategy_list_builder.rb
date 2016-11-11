class StrategyListBuilder < DomainBuilder
  def get(tick_count)
    parameter_list_builder = StrategyParameterListBuilder.new
    strategy_builder = StrategyBuilder.new tick_count

    strategy_list = StrategyList.new
    parameter_list_builder.each do |strategy_parameter_list|
      strategy_list.push(strategy_builder.get(strategy_parameter_list))
    end

    strategy_list
  end
end