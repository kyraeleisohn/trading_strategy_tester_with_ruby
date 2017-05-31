class ShowStrategyStatisticModel < Model
  def initialize(
      id,
      profit,
      profitability,
      trade_count,
      average_loss,
      average_win,
      maximum_loss,
      maximum_win,
      buy_percentage,
      buy_win_count,
      sell_win_count,
      average_trade_length,
      one_minute_trade_count,
      one_minute_trade_profit,
      one_minute_trade_win_percentage,
      spread_cost
  )
    @id                              = id
    @profit                          = profit
    @profitability                   = profitability
    @trade_count                     = trade_count
    @average_loss                    = average_loss
    @average_win                     = average_win
    @maximum_loss                    = maximum_loss
    @maximum_win                     = maximum_win
    @buy_percentage                  = buy_percentage
    @buy_win_count                   = buy_win_count
    @sell_win_count                  = sell_win_count
    @average_trade_length            = average_trade_length
    @one_minute_trade_count          = one_minute_trade_count
    @one_minute_trade_profit         = one_minute_trade_profit
    @one_minute_trade_win_percentage = one_minute_trade_win_percentage
    @spread_cost                     = spread_cost
  end

  def to_hash
    {
        id:                              @id,
        profit:                          @profit,
        profitability:                   @profitability,
        trade_count:                     @trade_count,
        average_loss:                    @average_loss,
        average_win:                     @average_win,
        maximum_loss:                    @maximum_loss,
        maximum_win:                     @maximum_win,
        buy_percentage:                  @buy_percentage,
        buy_win_count:                   @buy_win_count,
        sell_win_count:                  @sell_win_count,
        average_trade_length:            @average_trade_length,
        one_minute_trade_count:          @one_minute_trade_count,
        one_minute_trade_profit:         @one_minute_trade_profit,
        one_minute_trade_win_percentage: @one_minute_trade_win_percentage,
        spread_cost:                     @spread_cost,
    }
  end
end