class AaaStrategyIndicatorListBuilder < IndicatorListBuilder
  def get(tick_count)
    moving_average_indicator_builder = MovingAverageIndicatorBuilder.new
    psar_indicator_builder = PsarIndicatorBuilder.new

    AaaStrategyIndicatorList.new(
        generate_id,
        moving_average_indicator_builder.get_100_seconds(tick_count),
        psar_indicator_builder.get_100_minutes(tick_count)
    )
  end
end