
class ExchangeBuilder
  def get
    market_feed_repository = MarketFeedRepository.new
    market_feed_mapper = MarketFeedMapper.new market_feed_repository
    market_feed = MarketFeed.new market_feed_mapper

    strategy_description_repository = StrategyDescriptionRepository.new
    strategy_description_mapper = StrategyDescriptionMapper.new strategy_description_repository

    exchange_status = ExchangeStatus.new(
      SecureRandom.uuid
    )

    exchange_status_mapper_builder = ExchangeStatusMapperBuilder.new
    exchange_status_mapper = exchange_status_mapper_builder.get

    timer = Timer.new

    Exchange.new(
        market_feed,
        strategy_description_mapper,
        exchange_status,
        exchange_status_mapper,
        timer
    )
  end
end