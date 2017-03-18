
class AaaStrategyBuilder < StrategyBuilder
  protected

  def get_name
    'AAA'
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
    AaaStrategy.new(
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
    AaaStrategyIndicatorListBuilder.new
  end
end