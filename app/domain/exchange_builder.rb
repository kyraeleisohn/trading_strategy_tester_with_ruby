
class ExchangeBuilder
  def get
    market_feed_repository = MarketFeedRepository.new
    market_feed_mapper = MarketFeedMapper.new market_feed_repository
    market_feed = MarketFeed.new market_feed_mapper

    strategy_description_repository = StrategyDescriptionRepository.new
    strategy_description_mapper = StrategyDescriptionMapper.new strategy_description_repository
    Exchange.new(market_feed, strategy_description_mapper)
  end
end