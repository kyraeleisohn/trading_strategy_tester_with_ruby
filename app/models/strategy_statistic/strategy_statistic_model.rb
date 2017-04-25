class StrategyStatisticModel
  def initialize(mapper)
    @mapper = mapper
  end

  protected
  def get_statistic_as_array(statistic)
    {
        :id                              => statistic.id,
        :profit                          => statistic.profit,
        :profitability                   => statistic.profitability,
        :trade_count                     => statistic.trade_count,
        :average_loss                    => statistic.average_loss,
        :average_win                     => statistic.average_win,
        :maximum_loss                    => statistic.maximum_loss,
        :maximum_win                     => statistic.maximum_win,
        :buy_percentage                  => statistic.buy_percentage,
        :buy_win_count                   => statistic.buy_win_count,
        :sell_win_count                  => statistic.sell_win_count,
        :average_trade_length            => statistic.average_trade_length,
        :one_minute_trade_count          => statistic.one_minute_trade_count,
        :one_minute_trade_profit         => statistic.one_minute_trade_profit,
        :one_minute_trade_win_percentage => statistic.one_minute_trade_win_percentage,
        :spread_cost                     => statistic.spread_cost,
        :trade_list_url                  => get_trade_list_url(statistic.id),
    }
  end

  private
  def get_trade_list_url(statistic_id)
    Rails.application.routes.url_helpers.strategy_trades_path(
        {
            :strategy_id => statistic_id,
            :page => 1
        }
    )
  end
end