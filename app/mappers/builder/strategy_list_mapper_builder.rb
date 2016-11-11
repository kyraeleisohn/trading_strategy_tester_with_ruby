class StrategyListMapperBuilder < MapperBuilder
  def get
    strategy_mapper_builder = StrategyMapperBuilder.new
    strategy_mapper = strategy_mapper_builder.get

    StrategyListMapper.new(
      strategy_mapper
    )
  end
end