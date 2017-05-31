class StrategyServiceBuilder
  def get
    StrategyService.new(
        StrategyMapperBuilder.new.get,
        StrategyModelMapper.new
    )
  end
end