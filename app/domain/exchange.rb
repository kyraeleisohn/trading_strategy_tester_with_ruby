
class Exchange
  def initialize(feed, strategy_description_mapper)
    @feed = feed
    @strategy_description_mapper = strategy_description_mapper
    @strategy_list = Array.new
  end

  def run
    @feed.each do |market_state|
      @strategy_list.each do |strategy|
        strategy.tick market_state
      end
    end
  end

  def register(strategy)
    @strategy_list.push strategy
    @strategy_description_mapper.store strategy.description
  end
end