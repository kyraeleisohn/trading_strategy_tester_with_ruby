class StrategyListBuilder < DomainBuilder
  def get(tick_count)
    parameter_list_builder = get_parameter_list_builder
    strategy_builder = get_strategy_builder tick_count

    strategy_list = StrategyList.new
    parameter_list_builder.each do |strategy_parameter_list|
      strategy_list.push(strategy_builder.get(strategy_parameter_list))
    end

    strategy_list
  end

  protected

  def get_parameter_list_builder
    StrategyParameterListBuilder.new
  end

  def get_strategy_builder(tick_count)
    StrategyBuilder.new tick_count
  end
end