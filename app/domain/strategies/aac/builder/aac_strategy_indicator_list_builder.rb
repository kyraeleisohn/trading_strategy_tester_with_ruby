class AacStrategyIndicatorListBuilder < IndicatorListBuilder
  def get(tick_count)
    exchange_indicator_builder = ExchangeIndicatorBuilder.new
    psar_indicator_builder = PsarIndicatorBuilder.new
    exponential_moving_average_indicator_builder = ExponentialMovingAverageIndicatorBuilder.new
    macd_indicator_builder = MacdIndicatorBuilder.new
    macd_signal_line_indicator_builder = MacdSignalLineIndicatorBuilder.new

    AacStrategyIndicatorList.new(
      generate_id,
      psar_indicator_builder.get_seconds(tick_count),
      exchange_indicator_builder.get(tick_count),
      exponential_moving_average_indicator_builder.get_224_minutes(tick_count),
      macd_indicator_builder.get_minutes(tick_count),
      macd_signal_line_indicator_builder.get_minutes(tick_count)
    )
  end
end