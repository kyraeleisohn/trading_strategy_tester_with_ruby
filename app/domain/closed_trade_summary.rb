
class ClosedTradeSummary
  attr_reader(
    :id,
    :strategy_id,
    :profit,
    :trade_count,
    :winning_trades,
    :losing_trades,
    :win_profit,
    :loss_profit,
    :maximum_loss,
    :maximum_win,
    :buy_trade_count,
    :sell_trade_count,
    :buy_trade_win_count,
    :sell_trade_win_count,
    :sum_trade_length,
    :one_minute_trade_count,
    :one_minute_trade_profit,
    :one_minute_trade_wins,
    :spread_cost
  )

  def initialize(
    id,
    strategy_id,
    profit = 0,
    trade_count = 0,
    winning_trades = 0,
    losing_trades = 0,
    win_profit = 0,
    loss_profit = 0,
    maximum_loss = 0,
    maximum_win = 0,
    buy_trade_count = 0,
    sell_trade_count = 0,
    buy_trade_win_count = 0,
    sell_trade_win_count = 0,
    sum_trade_length = 0,
    one_minute_trade_count = 0,
    one_minute_trade_profit = 0,
    one_minute_trade_wins = 0,
    spread_cost = 0
  )
    @id = id
    @strategy_id = strategy_id
    @profit = profit
    @trade_count = trade_count
    @winning_trades = winning_trades
    @losing_trades = losing_trades
    @win_profit = win_profit
    @loss_profit = loss_profit
    @maximum_loss = maximum_loss
    @maximum_win = maximum_win
    @buy_trade_count = buy_trade_count
    @sell_trade_count = sell_trade_count
    @buy_trade_win_count = buy_trade_win_count
    @sell_trade_win_count = sell_trade_win_count
    @sum_trade_length = sum_trade_length
    @one_minute_trade_count = one_minute_trade_count
    @one_minute_trade_profit = one_minute_trade_profit
    @one_minute_trade_wins = one_minute_trade_wins
    @spread_cost = spread_cost
  end

  def add(closed_trade)
    @strategy_id = closed_trade.strategy_id

    profit = closed_trade.final_profit

    add_profit profit
    add_profitability profit
    add_loss_or_win profit
    calculate_max_win_or_loss profit

    add_spread_cost closed_trade.spread_cost

    add_buy_or_sell_count closed_trade

    add_buy_or_sell_win_count(closed_trade, profit)
    add_trade_length(closed_trade, profit)

    @trade_count +=1
  end

  private

  def add_spread_cost(spread_cost)
    @spread_cost += spread_cost
  end

  def add_profit(profit)
    @profit += profit
  end

  def add_profitability(profit)
    if is_win profit
      @winning_trades += 1
    else
      @losing_trades += 1
    end
  end

  def add_loss_or_win(profit)
    if is_win profit
      @win_profit += profit
    else
      @loss_profit += profit
    end
  end

  def calculate_max_win_or_loss(profit)
    if is_win(profit) && (profit > @maximum_win)
      @maximum_win = profit
    elsif profit < @maximum_loss
      @maximum_loss = profit
    end
  end

  def add_buy_or_sell_count(closed_trade)
    if closed_trade.is_buy
      @buy_trade_count += 1
    else
      @sell_trade_count += 1
    end
  end

  def add_buy_or_sell_win_count(closed_trade, profit)
    unless is_win profit
      return
    end

    if closed_trade.is_buy
      @buy_trade_win_count += 1
    else
      @sell_trade_win_count += 1
    end
  end

  def add_trade_length(closed_trade, profit)
    trade_length = closed_trade.closing_state.date_time.to_time - closed_trade.opening_state.date_time.to_time
    @sum_trade_length += trade_length.to_i

    if trade_length < 1.minutes
      @one_minute_trade_count += 1
      @one_minute_trade_profit += profit
      if is_win profit
        @one_minute_trade_wins += 1
      end
    end
  end

  def is_win(profit)
    profit > 0
  end
end