class RandomStrategyIndicatorListBuilder < IndicatorListBuilder
  def get(tick_count)
    moving_average_indicator_builder = MovingAverageIndicatorBuilder.new
    exchange_indicator_builder = ExchangeIndicatorBuilder.new

    indicator_list = super(tick_count)

    indicator_list.push moving_average_indicator_builder.get_100_seconds(tick_count)
    indicator_list.push exchange_indicator_builder.get(tick_count)

    indicator_list
  end
end