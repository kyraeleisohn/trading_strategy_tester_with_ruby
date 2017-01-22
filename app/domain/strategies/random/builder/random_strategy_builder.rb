
class RandomStrategyBuilder < StrategyBuilder
  protected

  def get_name
    'random'
  end

  def get_indicator_list_builder
    IndicatorListBuilder.new
  end
end