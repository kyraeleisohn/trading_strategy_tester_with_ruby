class AaaStrategyIndicatorListBuilder < IndicatorListBuilder
  def get
    moving_average_indicator_builder = MovingAverageIndicatorBuilder.new
    psar_indicator_builder = PsarIndicatorBuilder.new

    AaaStrategyIndicatorList.new(
        generate_id,
        moving_average_indicator_builder.get_100_seconds,
        psar_indicator_builder.get_100_minutes
    )
  end
end