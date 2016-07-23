class MarketFeed
  def initialize(market_feed_mapper)
    @market_feed_mapper = market_feed_mapper
  end

  def each
    @market_feed_mapper.each {|state| yield state}
  end
end