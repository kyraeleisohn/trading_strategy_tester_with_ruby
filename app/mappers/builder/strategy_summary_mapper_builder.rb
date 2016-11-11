class StrategySummaryMapperBuilder < MapperBuilder
  def get
    StrategySummaryMapper.new(
      StrategySummaryRepository.new,
      StrategySummarySearchRequestMapper.new
    )
  end
end