class IndicatorListMapperBuilder < MapperBuilder
  def get
    indicator_mapper_builder = IndicatorMapperBuilder.new
    indicator_mapper = indicator_mapper_builder.get

    indicator_list_repository = IndicatorListRepository.new

    IndicatorListMapper.new(
      indicator_list_repository,
      indicator_mapper
    )
  end
end