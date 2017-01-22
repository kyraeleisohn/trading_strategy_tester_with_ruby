class RandomStrategyListBuilder < StrategyListBuilder
  protected

  def get_parameter_list_builder
    RandomStrategyParameterListBuilder.new
  end

  def get_strategy_builder(tick_count)
    RandomStrategyBuilder.new tick_count
  end
end