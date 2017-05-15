class AabStrategyListBuilder < StrategyListBuilder
  protected

  def get_parameter_list_builder
    AabStrategyParameterListBuilder.new
  end

  def get_strategy_builder
    AabStrategyBuilder.new
  end
end