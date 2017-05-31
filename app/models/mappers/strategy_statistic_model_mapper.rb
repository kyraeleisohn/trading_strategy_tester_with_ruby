class StrategyStatisticModelMapper
  def map(statistic)
    ShowStrategyStatisticModel.new(
      statistic.id,
      statistic.profit,
      statistic.profitability,
      statistic.trade_count,
      statistic.average_loss,
      statistic.average_win,
      statistic.maximum_loss,
      statistic.maximum_win,
      statistic.buy_percentage,
      statistic.buy_win_count,
      statistic.sell_win_count,
      statistic.average_trade_length,
      statistic.one_minute_trade_count,
      statistic.one_minute_trade_profit,
      statistic.one_minute_trade_win_percentage,
      statistic.spread_cost,
    )
  end

  def map_multiple(statistic_list)
    IndexStrategyStatisticModel.new(statistic_list.collect {|statistic| map(statistic)})
  end
end