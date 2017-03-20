
class AacStrategyIndicatorList < IndicatorList
  attr_reader(:ma_indicator, :psar_indicator)

  def initialize(id, ma_indicator, psar_indicator)
    super(id, [ma_indicator, psar_indicator])
    @ma_indicator = ma_indicator
    @psar_indicator = psar_indicator
  end
end