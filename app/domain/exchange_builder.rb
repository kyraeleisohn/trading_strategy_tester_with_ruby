
class ExchangeBuilder
  CHART_RESOLUTION = 100

  def get
    market_feed_repository = MarketFeedRepository.new
    market_feed_mapper = MarketFeedMapper.new market_feed_repository
    market_feed = MarketFeed.new market_feed_mapper
    tick_count = market_feed.count

    exchange_id = SecureRandom.uuid
    exchange_status = ExchangeStatus.new(
      exchange_id
    )

    exchange_status_mapper_builder = ExchangeStatusMapperBuilder.new
    exchange_status_mapper = exchange_status_mapper_builder.get

    chart = Chart.new(
      get_chart_mod(tick_count),
      []
    )
    chart.assign exchange_id
    chart_mapper = ChartMapper.new(
      ChartRepository.new
    )

    timer = Timer.new

    strategy_list_builder = StrategyListBuilder.new
    strategy_list = strategy_list_builder.get tick_count

    Exchange.new(
      market_feed,
      exchange_status,
      exchange_status_mapper,
      chart,
      chart_mapper,
      timer,
      strategy_list
    )
  end

  private
  def get_chart_mod(tick_count)
    (tick_count.to_f / CHART_RESOLUTION.to_f).floor
  end
end