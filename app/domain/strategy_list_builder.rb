class StrategyListBuilder
  def get(tick_count)
    parameter_list_builder = StrategyParameterListBuilder.new
    strategy_list = StrategyList.new
    strategy_builder = StrategyFormulaBuilder.new

    parameter_list_builder.each do |strategy_parameter_list|
      strategy_list.push(strategy_builder.get(tick_count, strategy_parameter_list))
    end

    strategy_list
  end
end