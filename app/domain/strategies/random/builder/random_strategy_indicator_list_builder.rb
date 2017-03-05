class RandomStrategyIndicatorListBuilder < IndicatorListBuilder
  def get(tick_count)
    moving_average_indicator_builder = MovingAverageIndicatorBuilder.new
    exchange_indicator_builder = ExchangeIndicatorBuilder.new
    efficiency_ratio_indicator_builder = EfficiencyRatioIndicatorBuilder.new

    indicator_list = super(tick_count)

    indicator_list.push moving_average_indicator_builder.get_100_seconds(tick_count)
    indicator_list.push efficiency_ratio_indicator_builder.get_100_seconds(tick_count)
    indicator_list.push exchange_indicator_builder.get(tick_count)

    indicator_list
  end
end