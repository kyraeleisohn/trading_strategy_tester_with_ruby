class AacStrategyListBuilder < StrategyListBuilder
  protected

  def get_parameter_list_builder
    AacStrategyParameterListBuilder.new
  end

  def get_strategy_builder(tick_count)
    AacStrategyBuilder.new tick_count
  end
end