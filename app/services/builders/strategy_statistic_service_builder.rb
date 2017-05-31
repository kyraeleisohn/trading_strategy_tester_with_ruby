class StrategyStatisticServiceBuilder
  def get
    StrategyStatisticService.new(
        StrategyStatisticMapperBuilder.new.get,
        StrategyStatisticModelMapper.new
    )
  end
end