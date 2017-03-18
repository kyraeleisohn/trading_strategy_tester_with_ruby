
class ExchangeBuilder < DomainBuilder
  CHART_RESOLUTION = 100

  def get
    market_feed_repository = MarketFeedRepository.new
    market_feed_mapper = MarketFeedMapper.new market_feed_repository
    market_feed = MarketFeed.new market_feed_mapper
    tick_count = market_feed.count

    exchange_status = ExchangeStatus.new(
      generate_id
    )

    exchange_status_mapper_builder = ExchangeStatusMapperBuilder.new
    exchange_status_mapper = exchange_status_mapper_builder.get

    chart_builder = ChartBuilder.new tick_count
    chart = chart_builder.get 'exchange'

    chart_mapper_builder = ChartMapperBuilder.new
    chart_mapper = chart_mapper_builder.get

    timer = Timer.new

    strategy_list_builder = AaaStrategyListBuilder.new
    strategy_list = strategy_list_builder.get tick_count

    strategy_list_mapper_builder = StrategyListMapperBuilder.new
    strategy_list_mapper = strategy_list_mapper_builder.get

    Exchange.new(
      market_feed,
      exchange_status,
      exchange_status_mapper,
      chart,
      chart_mapper,
      timer,
      strategy_list,
      strategy_list_mapper
    )
  end
end