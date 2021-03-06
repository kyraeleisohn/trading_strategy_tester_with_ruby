
class RandomStrategyBuilder < StrategyBuilder
  protected

  def get_name
    'random'
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
    RandomStrategy.new(
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
    RandomStrategyIndicatorListBuilder.new
  end
end