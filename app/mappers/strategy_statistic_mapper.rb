class StrategyStatisticMapper
  def initialize(repository)
    @repository = repository
  end

  def find_by_id(statistic_id)
    table = @repository.find_by_id(statistic_id)

    from_table(table)
  end

  def find_all
    table_list = @repository.find_all

    table_list.collect { |table| from_table(table) }
  end

  def paginate(page, limit)
    table_list =  @repository.paginate(page, limit)

    table_list.collect { |table| from_table(table) }
  end

  def count
    @repository.count
  end

  def save(statistic)
    @repository.save(to_table(statistic))
  end

  private
  def to_table(statistic)
    StrategyStatisticTable.new(
      id: statistic.id,
      profit: statistic.profit,
      profitability: statistic.profitability,
      trade_count: statistic.trade_count,
      average_loss: statistic.average_loss,
      average_win: statistic.average_win,
      maximum_loss: statistic.maximum_loss,
      maximum_win: statistic.maximum_win,
      buy_percentage: statistic.buy_percentage,
      buy_win_count: statistic.buy_win_count,
      sell_win_count: statistic.sell_win_count,
      average_trade_length: statistic.average_trade_length,
      one_minute_trade_count: statistic.one_minute_trade_count,
      one_minute_trade_profit: statistic.one_minute_trade_profit,
      one_minute_trade_win_percentage: statistic.one_minute_trade_win_percentage
    )
  end

  def from_table(table)
    StrategyStatistic.new(
      table.id,
      table.profit,
      table.profitability,
      table.trade_count,
      table.average_loss,
      table.average_win,
      table.maximum_loss,
      table.maximum_win,
      table.buy_percentage,
      table.buy_win_count,
      table.sell_win_count,
      table.average_trade_length,
      table.one_minute_trade_count,
      table.one_minute_trade_profit,
      table.one_minute_trade_win_percentage
    )
  end
end