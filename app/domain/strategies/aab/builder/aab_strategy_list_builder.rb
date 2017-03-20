class AabStrategyListBuilder < StrategyListBuilder
  protected

  def get_parameter_list_builder
    AabStrategyParameterListBuilder.new
  end

  def get_strategy_builder(tick_count)
    AabStrategyBuilder.new tick_count
  end
end