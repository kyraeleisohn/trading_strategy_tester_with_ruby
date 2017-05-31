class StrategyStatisticMapperBuilder < MapperBuilder
  def get
    StrategyStatisticMapper.new(
      StrategySummaryMapperBuilder.new.get
    )
  end
end