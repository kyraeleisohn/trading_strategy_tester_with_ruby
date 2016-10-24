class StrategySummaryMapper < Mapper
  def initialize(repository, search_request_mapper)
    @repository = repository
    @search_request_mapper = search_request_mapper
  end

  def find(search_request)
    table_list = @repository.find(@search_request_mapper.get_as_filter(search_request))

    table_list.collect { |table| from_table table }
  end

  def find_one(search_request)
    domains = find search_request

    domains.first
  end

  def paginate(page, limit)
    table_list = @repository.paginate(page, limit)

    table_list.collect { |table| from_table(table) }
  end

  def count
    @repository.count
  end

  def save(summary)
    @repository.save(to_table(summary))
  end

  private
  def to_table(summary)
    StrategySummaryTable.new(
      id: summary.id,
      strategy_id: summary.strategy_id,
      profit: summary.profit,
      trade_count: summary.trade_count,
      winning_trades: summary.winning_trades,
      losing_trades: summary.losing_trades,
      win_profit: summary.win_profit,
      loss_profit: summary.loss_profit,
      maximum_loss: summary.maximum_loss,
      maximum_win: summary.maximum_win,
      buy_trade_count: summary.buy_trade_count,
      sell_trade_count: summary.sell_trade_count,
      buy_trade_win_count: summary.buy_trade_win_count,
      sell_trade_win_count: summary.sell_trade_win_count,
      sum_trade_length: summary.sum_trade_length,
      one_minute_trade_count: summary.one_minute_trade_count,
      one_minute_trade_profit: summary.one_minute_trade_profit,
      one_minute_trade_wins: summary.one_minute_trade_wins,
    )
  end

  def from_table(table)
    ClosedTradeSummary.new(
        table.id,
        table.strategy_id,
        table.profit,
        table.trade_count,
        table.winning_trades,
        table.losing_trades,
        table.win_profit,
        table.loss_profit,
        table.maximum_loss,
        table.maximum_win,
        table.buy_trade_count,
        table.sell_trade_count,
        table.buy_trade_win_count,
        table.sell_trade_win_count,
        table.sum_trade_length,
        table.one_minute_trade_count,
        table.one_minute_trade_profit,
        table.one_minute_trade_wins
    )
  end
end