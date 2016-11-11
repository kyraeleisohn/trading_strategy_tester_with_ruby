class StrategyMapperBuilder
  def get
    chart_mapper_builder = ChartMapperBuilder.new
    chart_mapper = chart_mapper_builder.get

    StrategyMapper.new(
      StrategyRepository.new,
      chart_mapper
    )
  end
end