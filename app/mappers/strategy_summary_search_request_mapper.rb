class StrategySummarySearchRequestMapper < Mapper
  def get_as_filter(search_request)
    if search_request.strategy_id then
      {:strategy_id => search_request.strategy_id}
    end
  end
end