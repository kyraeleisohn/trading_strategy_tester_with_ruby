
class ExchangeBuilder
  def get
    market_feed_repository = MarketFeedRepository.new
    market_feed_mapper = MarketFeedMapper.new market_feed_repository
    market_feed = MarketFeed.new market_feed_mapper

    exchange_status = ExchangeStatus.new(
      SecureRandom.uuid
    )

    exchange_status_mapper_builder = ExchangeStatusMapperBuilder.new
    exchange_status_mapper = exchange_status_mapper_builder.get

    timer = Timer.new

    strategy_list_builder = StrategyListBuilder.new
    strategy_list = strategy_list_builder.get market_feed.count

    Exchange.new(
      market_feed,
      exchange_status,
      exchange_status_mapper,
      timer,
      strategy_list
    )
  end
end