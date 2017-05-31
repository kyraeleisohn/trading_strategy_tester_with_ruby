class AaaStrategyListBuilder < StrategyListBuilder
  protected

  def get_parameter_list_builder
    AaaStrategyParameterListBuilder.new
  end

  def get_strategy_builder
    AaaStrategyBuilder.new
  end
end