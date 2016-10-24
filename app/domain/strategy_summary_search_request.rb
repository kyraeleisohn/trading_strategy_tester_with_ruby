class StrategySummarySearchRequest
  attr_accessor :strategy_id

  def only_with_strategy_id(strategy_id)
    @strategy_id = strategy_id
  end
end