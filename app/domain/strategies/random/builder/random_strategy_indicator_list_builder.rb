class RandomStrategyIndicatorListBuilder < IndicatorListBuilder
  def get(tick_count)
    moving_average_indicator_builder = MovingAverageIndicatorBuilder.new
    exchange_indicator_builder = ExchangeIndicatorBuilder.new
    efficiency_ratio_indicator_builder = EfficiencyRatioIndicatorBuilder.new
    psar_indicator_builder = PsarIndicatorBuilder.new
    lowest_value_indicator_builder = LowestValueIndicatorBuilder.new
    highest_value_indicator_builder = HighestValueIndicatorBuilder.new

    indicator_list = super(tick_count)

    indicator_list.push moving_average_indicator_builder.get_100_seconds(tick_count)
    indicator_list.push efficiency_ratio_indicator_builder.get_100_seconds(tick_count)
    indicator_list.push psar_indicator_builder.get_100_minutes(tick_count)
    indicator_list.push exchange_indicator_builder.get(tick_count)
    indicator_list.push lowest_value_indicator_builder.get_100_seconds(tick_count)
    indicator_list.push highest_value_indicator_builder.get_100_seconds(tick_count)

    indicator_list
  end
end