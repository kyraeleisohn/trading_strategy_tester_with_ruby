
class SummaryConverter
  def get_as_statistic summary
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

  def get_one_minute_trade_win_percentage summary
    summary.one_minute_trade_wins.percent_of summary.one_minute_trade_count
  end

  def get_buy_percentage summary
    summary.buy_trade_count.percent_of summary.trade_count
  end

  def get_average_win summary
    summary.win_profit.percent_of summary.winning_trades
  end

  def get_average_loss summary
    summary.loss_profit.percent_of summary.losing_trades
  end

  def get_profitability summary
    summary.winning_trades.percent_of summary.trade_count
  end

  def get_average_trade_length summary
    if summary.trade_count.equal? 0 then
      return 0
    end
    summary.sum_trade_length / summary.trade_count
  end
end