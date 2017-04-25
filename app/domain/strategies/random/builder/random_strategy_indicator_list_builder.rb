class RandomStrategyIndicatorListBuilder < IndicatorListBuilder
  def get
    moving_average_indicator_builder = MovingAverageIndicatorBuilder.new
    exchange_indicator_builder = ExchangeIndicatorBuilder.new
    efficiency_ratio_indicator_builder = EfficiencyRatioIndicatorBuilder.new
    psar_indicator_builder = PsarIndicatorBuilder.new
    lowest_value_indicator_builder = LowestValueIndicatorBuilder.new
    highest_value_indicator_builder = HighestValueIndicatorBuilder.new
    exponential_moving_average_indicator_builder = ExponentialMovingAverageIndicatorBuilder.new
    macd_indicator_builder = MacdIndicatorBuilder.new
    macd_signal_line_indicator_builder = MacdSignalLineIndicatorBuilder.new

    indicator_list = super

    #indicator_list.push moving_average_indicator_builder.get_100_seconds
    #indicator_list.push efficiency_ratio_indicator_builder.get_100_seconds
    indicator_list.push psar_indicator_builder.get_seconds
    indicator_list.push exchange_indicator_builder.get
    #indicator_list.push lowest_value_indicator_builder.get_100_seconds
    #indicator_list.push highest_value_indicator_builder.get_100_seconds
    #indicator_list.push exponential_moving_average_indicator_builder.get_100_seconds
    indicator_list.push macd_indicator_builder.get_seconds
    indicator_list.push macd_signal_line_indicator_builder.get_seconds

    indicator_list
  end
end