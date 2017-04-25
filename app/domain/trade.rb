class Trade
  attr_reader :id, :opening_state, :strategy_id
  attr_accessor :closing_state

  def initialize(strategy_id, id, opening_state)
    @strategy_id = strategy_id
    @id = id
    @opening_state = opening_state
  end

  def is_sell
    false
  end

  def is_buy
    false
  end

  def profit(closing_state)
    if is_buy
      return closing_state.bid_price.to_f - @opening_state.ask_price.to_f
    end

    @opening_state.bid_price.to_f - closing_state.ask_price.to_f
  end

  def final_profit
    profit @closing_state
  end

  def spread_cost
    @opening_state.ask_price.to_f - @opening_state.bid_price.to_f
  end

  def opening_price
    is_buy ? @opening_state.ask_price.to_f : @opening_state.bid_price.to_f
  end

  def closing_price
    is_buy ? @closing_state.bid_price.to_f : @closing_state.ask_price.to_f
  end

  def opening_date_time
    @opening_state.date_time
  end

  def closing_date_time
    @closing_state.date_time
  end
end