class StrategySummaryMapperBuilder
  def get
    repository = StrategySummaryRepository.new
    search_request_mapper = StrategySummarySearchRequestMapper.new

    StrategySummaryMapper.new(
      repository,
      search_request_mapper
    )
  end
end