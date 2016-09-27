class StrategyFormulaBuilder
  CHART_RESOLUTION = 500

  def get(tick_count, strategy_parameter_list)
    trade_handler_builder = TradeHandlerBuilder.new
    trade_handler = trade_handler_builder.get

    strategy_description_repository = StrategyDescriptionRepository.new
    strategy_description_mapper = StrategyDescriptionMapper.new strategy_description_repository

    chart = Chart.new(
      get_chart_mod(tick_count),
      []
    )

    chart_repository = ChartRepository.new
    chart_mapper = ChartMapper.new chart_repository

    StrategyFormula.new(
      trade_handler,
      strategy_parameter_list,
      strategy_description_mapper,
      chart,
      chart_mapper
    )
  end

  private
  def get_chart_mod(tick_count)
    (tick_count.to_f / CHART_RESOLUTION.to_f).floor
  end
end