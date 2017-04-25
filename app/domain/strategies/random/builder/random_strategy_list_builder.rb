class RandomStrategyListBuilder < StrategyListBuilder
  protected

  def get_parameter_list_builder
    RandomStrategyParameterListBuilder.new
  end

  def get_strategy_builder
    RandomStrategyBuilder.new
  end
end