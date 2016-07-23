class GetStrategyStatisticModel < StrategyStatisticModel
  def get(id)
    get_statistic_as_array(@mapper.find_by_id(id))
  end
end