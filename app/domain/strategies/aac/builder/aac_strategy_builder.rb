
class AacStrategyBuilder < StrategyBuilder
  protected

  def get_name
    'AAC'
  end

  def get_strategy(
      id,
      name,
      parameter_list,
      trade_handler,
      chart,
      indicator_list,
      time_filter
  )
    AacStrategy.new(
        id,
        name,
        parameter_list,
        trade_handler,
        chart,
        indicator_list,
        time_filter
    )
  end

  def get_indicator_list_builder
    AacStrategyIndicatorListBuilder.new
  end
end