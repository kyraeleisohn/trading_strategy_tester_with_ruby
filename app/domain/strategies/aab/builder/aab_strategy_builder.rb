
class AabStrategyBuilder < StrategyBuilder
  protected

  def get_name
    'AAB'
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
    AabStrategy.new(
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
    AabStrategyIndicatorListBuilder.new
  end
end