
class IndicatorList < MarketStateAwareList
  attr_reader :id

  def initialize(id, items)
    @id = id
    super items
  end
end