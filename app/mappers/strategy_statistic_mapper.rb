class StrategyStatisticMapper < Mapper
  def initialize(summary_mapper)
    @summary_mapper = summary_mapper
  end

  def find_by_id(strategy_id)
    search_request = StrategySummarySearchRequest.new
    search_request.only_with_strategy_id strategy_id

    table = @summary_mapper.find_one search_request

    from_summary(table)
  end

  def find_all
    search_request = StrategySummarySearchRequest.new
    table_list = @summary_mapper.find search_request

    table_list.collect { |table| from_summary(table) }
  end

  def paginate(page, limit)
    table_list =  @summary_mapper.paginate(page, limit)

    table_list.collect { |table| from_summary(table) }
  end

  def count
    @summary_mapper.count
  end

  private
  def from_summary(summary)
    StrategyStatistic.new(
        summary.strategy_id,
        summary.profit,
        get_profitability(summary),
        summary.trade_count,
        get_average_loss(summary),
        get_average_win(summary),
        summary.maximum_loss,
        summary.maximum_win,
        get_buy_percentage(summary),
        summary.buy_trade_win_count,
        summary.sell_trade_win_count,
        get_average_trade_length(summary),
        summary.one_minute_trade_count,
        summary.one_minute_trade_profit,
        get_one_minute_trade_win_percentage(summary)
    )
  end

  def get_one_minute_trade_win_percentage(summary)
    summary.one_minute_trade_wins.percent_of summary.one_minute_trade_count
  end

  def get_buy_percentage(summary)
    summary.buy_trade_count.percent_of summary.trade_count
  end

  def get_average_win(summary)
    summary.win_profit.percent_of summary.winning_trades
  end

  def get_average_loss(summary)
    summary.loss_profit.percent_of summary.losing_trades
  end

  def get_profitability(summary)
    summary.winning_trades.percent_of summary.trade_count
  end

  def get_average_trade_length(summary)
    if summary.trade_count.equal? 0 then
      return 0
    end
    summary.sum_trade_length / summary.trade_count
  end
end