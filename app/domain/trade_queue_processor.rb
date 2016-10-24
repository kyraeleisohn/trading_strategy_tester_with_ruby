class TradeQueueProcessor
  def initialize(queue_mapper, trade_mapper, strategy_summary_mapper)
    @queue_mapper = queue_mapper
    @trade_mapper = trade_mapper
    @strategy_summary_mapper = strategy_summary_mapper
  end

  def run
    while true do
      queue_item_list = @queue_mapper.paginate(0, 10)
      queue_item_list.each do |queue_item|
        process queue_item
      end

      if queue_item_list.empty?
        sleep 1
      end
    end
  end

  private
  def process(queue_item)
    strategy_summary = get_summary queue_item.strategy_id
    strategy_summary.add queue_item
    @strategy_summary_mapper.save strategy_summary
    @trade_mapper.store queue_item
    @queue_mapper.remove queue_item
  end

  def get_summary(strategy_id)
    search_request = StrategySummarySearchRequest.new
    search_request.only_with_strategy_id strategy_id
    strategy_summary = @strategy_summary_mapper.find_one search_request

    if strategy_summary.nil?
      return ClosedTradeSummary.new(SecureRandom.hex(32), strategy_id)
    end

    strategy_summary
  end
end