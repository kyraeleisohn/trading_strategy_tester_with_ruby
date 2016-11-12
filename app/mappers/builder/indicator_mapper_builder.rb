class IndicatorMapperBuilder
  def get
    chart_mapper_builder = ChartMapperBuilder.new
    chart_mapper = chart_mapper_builder.get

    IndicatorMapper.new(
      IndicatorRepository.new,
      chart_mapper
    )
  end
end