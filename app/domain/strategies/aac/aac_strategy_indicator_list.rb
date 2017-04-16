
class AacStrategyIndicatorList < IndicatorList
  attr_reader(
      :psar_indicator,
      :exchange_indicator,
      :exponential_moving_average_indicator,
      :macd_indicator,
      :macd_signal_line_indicator
  )

  def initialize(
      id,
      psar_indicator,
      exchange_indicator,
      exponential_moving_average_indicator,
      macd_indicator,
      macd_signal_line_indicator
  )
    super(
        id,
        [
            psar_indicator,
            exchange_indicator,
            exponential_moving_average_indicator,
            macd_indicator,
            macd_signal_line_indicator
        ]
    )

    @psar_indicator = psar_indicator
    @exchange_indicator = exchange_indicator
    @exponential_moving_average_indicator = exponential_moving_average_indicator
    @macd_indicator = macd_indicator
    @macd_signal_line_indicator = macd_signal_line_indicator
  end
end